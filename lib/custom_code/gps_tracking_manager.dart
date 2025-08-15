import 'dart:async';
import 'dart:io' show Platform;
import 'package:geolocator/geolocator.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Petit conteneur pour la fenêtre glissante (allure instantanée)
class _Seg {
  final int dt; // secondes
  final double dm; // mètres
  _Seg(this.dt, this.dm);
}

/// Gestionnaire de tracking GPS pour TrailDog
/// - Distance cumulée
/// - Vitesse instantanée lissée (km/h) + anti-spike
/// - Allure instantanée (min/km) via fenêtre glissante
/// - Moyennes sur **temps en mouvement** (moving time)
/// - Dénivelé : base au 1er point + lissage + seuils + anti-spikes
class GpsTrackingManager {
  // ===========================
  // ====== CONFIG PARAMS ======
  // ===========================

  // Filtres anti-bruit position
  static const double _maxAccuracyMeters = 60.0; // 20→60 : tolère GPS réel
  static const double _minMoveMeters = 3.0; // 10→3  : petites avances en marche
  static const int _minTimeDiffSec = 1; // 2→1   : cadence courante des fixes

  // Vitesse instantanée (EMA)
  static const double _speedEmaAlpha = 0.25; // 0.2–0.3 : lissage doux
  static const double _spikeFactor =
      2.0; // anti-pic: autorise 2x l’EMA + offset
  static const double _spikeOffsetKmh = 5.0;

  // Allure instantanée (fenêtre glissante)
  static const int _paceWinSec = 30; // fenêtre ~30 s
  static const double _paceWinMeters = 150.0; // ou ~150 m
  static const int _paceMinSec = 8; // minimum de matière pour calcul
  static const double _paceMinMeters = 30.0;

  // Seuil d’affichage pour les MOYENNES (évite valeur délirante au début)
  static const int _minSecForAvg = 30; // au moins 30 s
  static const double _minKmForAvg = 0.10; // et 100 m

  // Détection du mouvement (pour moving time & auto-pause logique)
  static const double _minMovingSpeedMs = 0.5; // <0.5 m/s ≈ à l’arrêt
  static const int _stillGraceSec = 5; // tolérance avant “arrêt”

  // Dénivelé (altitude)
  static const double _altEmaAlpha = 0.20; // lissage altitude
  static const double _minAltStep = 0.5; // cumule D+ si montée > 0.5 m
  static const double _maxAltJump = 12.0; // anti-pic vertical (par échantillon)

  // Logs de debug (mets à true pour voir ce qui passe/rejeté)
  static const bool _DEBUG_LOGS = false;

  // ===========================
  // ====== STATE PRIVE ========
  // ===========================

  static bool _isTracking = false;
  static bool _isPaused = false;

  static Timer? _timer;
  static StreamSubscription<Position>? _positionStream;

  static Position? _previousPosition;

  // Cumuls & mémoires
  static double _distanceMeters = 0.0; // distance totale en mètres
  static double _elevationGain = 0.0; // D+ cumulé (m)
  static int _samples = 0; // nb segments validés (pour warm-up vitesse)

  // Vitesse instantanée lissée (EMA km/h)
  static double _emaSpeedKmh = 0.0;

  // Mouvement (pour moving time)
  static bool _isMoving = false;
  static int _stillSec = 0; // secondes consécutives "à l’arrêt"

  // Fenêtre glissante pour allure instantanée
  static final List<_Seg> _win = <_Seg>[];

  // Altitude / Dénivelé
  static double? _baseAltitude; // altitude de départ (lissée)
  static double? _lastAltitude; // dernière altitude lissée
  static double _emaAltitude = 0.0; // filtre EMA altitude

  // ===========================
  // ========= START ===========
  // ===========================
  static void start() {
    if (_isTracking) {
      if (_DEBUG_LOGS) print("Tracking déjà en cours");
      return;
    }
    if (_DEBUG_LOGS) print("GpsTrackingManager started");

    // Réinit AppState (affichage)
    FFAppState().update(() {
      FFAppState().durationSec = 0; // temps total (horloge)
      FFAppState().movingDurationSec = 0; // temps en mouvement
      FFAppState().totalDistance = 0.0; // km
      FFAppState().pathList = [];
      FFAppState().elevationGain = 0.0; // m
      FFAppState().currentElevationDiff = 0.0;
      FFAppState().speedKmh = 0.0; // instantanée lissée
      FFAppState().avgSpeedKmh = 0.0; // moyenne (moving)
      FFAppState().instPaceMinPerKm = 0.0; // instantanée (min/km)
      FFAppState().paceMinPerKm = 0.0; // moyenne (min/km, moving)
    });

    // Réinit internes
    _isTracking = true;
    _isPaused = false;
    _previousPosition = null;
    _distanceMeters = 0.0;
    _elevationGain = 0.0;
    _samples = 0;
    _emaSpeedKmh = 0.0;
    _isMoving = false;
    _stillSec = 0;
    _win.clear();

    _baseAltitude = null;
    _lastAltitude = null;
    _emaAltitude = 0.0;

    // -------- Timer 1s : durée + moyennes (sur moving time) --------
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // Temps total
      FFAppState().update(() => FFAppState().durationSec += 1);

      // Temps EN MOUVEMENT uniquement si _isMoving est vrai
      if (_isMoving) {
        FFAppState().update(() => FFAppState().movingDurationSec += 1);
      }

      final double km = FFAppState().totalDistance;
      final int moveSec = FFAppState().movingDurationSec;

      // Moyennes sur moving time seulement quand on a assez de matière
      if (moveSec >= _minSecForAvg && km >= _minKmForAvg) {
        final double avgKmh = km / (moveSec / 3600.0);
        final double avgPaceMinPerKm = (moveSec / 60.0) / km;

        FFAppState().update(() {
          FFAppState().avgSpeedKmh = _round2(avgKmh);
          FFAppState().paceMinPerKm = _round2(avgPaceMinPerKm);
        });
      } else {
        // masque l'allure moyenne en début de session
        FFAppState().update(() {
          FFAppState().avgSpeedKmh = 0.0;
          FFAppState().paceMinPerKm = 0.0; // UI: affiche "--:--/km" si 0
        });
      }
    });

    // -------- Paramètres stream GPS (Android: cadence/interval) ----
    final LocationSettings ls = Platform.isAndroid
        ? AndroidSettings(
            accuracy: LocationAccuracy.bestForNavigation,
            distanceFilter: 2, // ~2m
            intervalDuration: const Duration(seconds: 2), // cadence mini
            // forceLocationManager: true, // optionnel sur certains devices
          )
        : const LocationSettings(
            accuracy: LocationAccuracy.best, // iOS / Web
            distanceFilter: 2,
          );

    // -------- Stream GPS -------------------------------------------
    _positionStream = Geolocator.getPositionStream(
      locationSettings: ls,
    ).listen((Position pos) {
      final DateTime nowTs = pos.timestamp ?? DateTime.now();

      // 1) Filtre précision —> on avance quand même la fenêtre
      if (pos.accuracy > _maxAccuracyMeters) {
        if (_DEBUG_LOGS) {
          print("Point ignoré (accuracy=${pos.accuracy.toStringAsFixed(0)}m)");
        }
        _previousPosition = pos; // << évite gros delta au point suivant
        // Optionnel: garder un polyline continu
        // FFAppState().addToPathList(LatLng(pos.latitude, pos.longitude));
        return;
      }

      // 2) Lissage altitude + base / D+
      _processAltitude(pos);

      // 3) Premier point = init & sortie
      if (_previousPosition == null) {
        _previousPosition = pos;
        FFAppState().addToPathList(LatLng(pos.latitude, pos.longitude));
        _samples = 1;
        return;
      }

      // 4) Calculs segmentaires distance/temps
      final DateTime prevTs = _previousPosition!.timestamp ??
          nowTs.subtract(const Duration(seconds: 1));
      final int timeDiff = nowTs.difference(prevTs).inSeconds;

      final double distance = Geolocator.distanceBetween(
        _previousPosition!.latitude,
        _previousPosition!.longitude,
        pos.latitude,
        pos.longitude,
      );

      // 5) Détection du mouvement (même si on rejette ensuite)
      final double instSpeedMsRaw = timeDiff > 0 ? (distance / timeDiff) : 0.0;
      _updateMovingState(instSpeedMsRaw, timeDiff);

      // 6) Filtres distance/temps (anti-bruit)
      if (distance < _minMoveMeters || timeDiff < _minTimeDiffSec) {
        if (_DEBUG_LOGS) {
          print("Segment ignoré: d=${distance.toStringAsFixed(1)}m, "
              "dt=$timeDiff, v=${(instSpeedMsRaw * 3.6).toStringAsFixed(1)} km/h");
        }
        // Avance la référence pour éviter gros delta au prochain point
        _previousPosition = pos;
        return;
      }

      // 7) Warm-up vitesse (stabilise les 1ers segments)
      if (_samples < 3) {
        // _warmupSamples = 3
        _previousPosition = pos;
        _samples++;
        FFAppState().addToPathList(LatLng(pos.latitude, pos.longitude));
        // On peut choisir de compter la distance dès le warm-up => OUI
        _distanceMeters += distance;
        _publishDistance();
        return;
      }

      // 8) Distance cumulée
      _distanceMeters += distance;
      _publishDistance();

      // 9) Vitesse instantanée (km/h) + anti-spike + lissage EMA
      if (timeDiff > 0) {
        final double instKmh = (distance / timeDiff) * 3.6;

        final bool isSpike = (_emaSpeedKmh > 0 &&
            instKmh > (_emaSpeedKmh * _spikeFactor + _spikeOffsetKmh));

        if (!isSpike) {
          _emaSpeedKmh =
              _speedEmaAlpha * instKmh + (1 - _speedEmaAlpha) * _emaSpeedKmh;

          FFAppState()
              .update(() => FFAppState().speedKmh = _round2(_emaSpeedKmh));

          // Historique pour chart si dispo
          FFAppState().addToSpeedList(_round2(_emaSpeedKmh));
        } else if (_DEBUG_LOGS) {
          print("Spike ignoré: inst=${instKmh.toStringAsFixed(1)} "
              "ema=${_emaSpeedKmh.toStringAsFixed(1)}");
        }
      }

      // 10) Allure instantanée (min/km) via fenêtre glissante
      _pushSegmentToPaceWindow(timeDiff, distance);

      // 11) Mise à jour de la position & tracé
      _previousPosition = pos;
      FFAppState().addToPathList(LatLng(pos.latitude, pos.longitude));
    }, onError: (e) {
      print("GPS Error: $e");
    });
  }

  // ===========================
  // =========== STOP ==========
  // ===========================
  static Future<void> stop() async {
    await _positionStream?.cancel();
    _positionStream = null;

    _timer?.cancel();
    _timer = null;

    _isTracking = false;
    _isPaused = false;

    // On n'écrase PAS l'UI (garde le résumé) — on réinitialise l’interne.
    _previousPosition = null;
    _distanceMeters = 0.0;
    _elevationGain = 0.0;
    _samples = 0;
    _emaSpeedKmh = 0.0;
    _isMoving = false;
    _stillSec = 0;
    _win.clear();
    _baseAltitude = null;
    _lastAltitude = null;
    _emaAltitude = 0.0;
  }

  // ===========================
  // =========== PAUSE =========
  // ===========================
  static Future<void> pause() async {
    if (_DEBUG_LOGS) print("GpsTrackingManager paused");
    _isPaused = true;

    _timer?.cancel();
    _timer = null;

    // Evite un énorme delta temps à la reprise
    _previousPosition = null;

    // Ces méthodes renvoient void => pas de await
    _positionStream?.pause();
  }

  // ===========================
  // ========= RESUME ==========
  // ===========================
  static Future<void> resume() async {
    if (!_isPaused) return;

    if (_DEBUG_LOGS) print("GpsTrackingManager resumed");
    _isPaused = false;

    // Redémarre le timer
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      FFAppState().update(() => FFAppState().durationSec += 1);
      if (_isMoving) {
        FFAppState().update(() => FFAppState().movingDurationSec += 1);
      }

      final double km = FFAppState().totalDistance;
      final int moveSec = FFAppState().movingDurationSec;

      if (moveSec >= _minSecForAvg && km >= _minKmForAvg) {
        final double avgKmh = km / (moveSec / 3600.0);
        final double avgPace = (moveSec / 60.0) / km;
        FFAppState().update(() {
          FFAppState().avgSpeedKmh = _round2(avgKmh);
          FFAppState().paceMinPerKm = _round2(avgPace);
        });
      }
    });

    if (_positionStream?.isPaused ?? false) {
      _positionStream?.resume(); // pas de await
    }
  }

  // ===========================
  // ======= PRIVÉS (utils) ====
  // ===========================

  /// Met à jour `totalDistance` (km, arrondi 3 décimales)
  static void _publishDistance() {
    FFAppState().update(
        () => FFAppState().totalDistance = _round3(_distanceMeters / 1000.0));
  }

  /// Détection mouvement / arrêt avec tolérance (_stillGraceSec)
  static void _updateMovingState(double instSpeedMs, int timeDiff) {
    if (instSpeedMs >= _minMovingSpeedMs) {
      _isMoving = true;
      _stillSec = 0;
    } else {
      _stillSec += (timeDiff > 0 ? timeDiff : 1);
      if (_stillSec >= _stillGraceSec) _isMoving = false;
    }
  }

  /// Fenêtre glissante pour l’allure instantanée (min/km)
  static void _pushSegmentToPaceWindow(int dt, double dm) {
    if (dt <= 0 || dm <= 0) return;

    // Empile le segment courant
    _win.add(_Seg(dt, dm));

    // Conserve ~30s OU ~150m (le 1er atteint clôture)
    int accT = 0;
    double accD = 0.0;
    for (int i = _win.length - 1; i >= 0; i--) {
      accT += _win[i].dt;
      accD += _win[i].dm;
      if (accT >= _paceWinSec || accD >= _paceWinMeters) {
        if (i > 0) _win.removeRange(0, i); // retire l’ancien
        break;
      }
    }

    // Publie seulement si on a un minimum de matière
    if (accT >= _paceMinSec && accD >= _paceMinMeters) {
      final double instPaceMinPerKm = (accT / 60.0) / (accD / 1000.0);
      FFAppState().update(() {
        FFAppState().instPaceMinPerKm = _round2(instPaceMinPerKm);
      });
    } else {
      // Masque l’allure instantanée (UI pourra afficher "--:--/km" si 0)
      FFAppState().update(() {
        FFAppState().instPaceMinPerKm = 0.0;
      });
    }
  }

  /// Lissage & cumul du D+.
  /// - _baseAltitude : altitude de départ (lissée) => currentElevationDiff vs départ
  /// - _lastAltitude : altitude précédente lissée
  /// - _elevationGain : somme des montées significatives (> _minAltStep)
  static void _processAltitude(Position pos) {
    final double rawAlt = pos.altitude;

    // EMA altitude
    if (_emaAltitude == 0.0) {
      _emaAltitude = rawAlt;
    } else {
      _emaAltitude = _altEmaAlpha * rawAlt + (1 - _altEmaAlpha) * _emaAltitude;
    }
    final double smoothAlt = _emaAltitude;

    // Init base
    if (_baseAltitude == null) {
      _baseAltitude = smoothAlt;
      _lastAltitude = smoothAlt;
      FFAppState().update(() {
        FFAppState().elevationGain = 0.0;
        FFAppState().currentElevationDiff = 0.0;
      });
      return;
    }

    // Diff vs dernier point lissé
    final double altDiff = smoothAlt - (_lastAltitude ?? smoothAlt);

    // Anti-pic vertical
    if (altDiff.abs() <= _maxAltJump) {
      // Cumul D+ uniquement si montée significative
      if (altDiff > _minAltStep) {
        _elevationGain += altDiff;
        FFAppState()
            .update(() => FFAppState().elevationGain = _round1(_elevationGain));
      }

      // Diff courant vs départ (peut être négatif)
      final double fromStart = smoothAlt - (_baseAltitude ?? smoothAlt);
      FFAppState()
          .update(() => FFAppState().currentElevationDiff = _round1(fromStart));
    }

    _lastAltitude = smoothAlt;

    if (_DEBUG_LOGS) {
      print("ALT raw=${rawAlt.toStringAsFixed(1)} "
          "ema=${smoothAlt.toStringAsFixed(1)} "
          "d=${altDiff.toStringAsFixed(1)} "
          "D+=${_elevationGain.toStringAsFixed(1)}");
    }
  }

  // Helpers arrondis
  static double _round1(double v) => double.parse(v.toStringAsFixed(1));
  static double _round2(double v) => double.parse(v.toStringAsFixed(2));
  static double _round3(double v) => double.parse(v.toStringAsFixed(3));
}
