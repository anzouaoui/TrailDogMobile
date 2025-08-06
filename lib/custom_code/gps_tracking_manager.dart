import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GpsTrackingManager {
  static bool _isTracking = false;
  static Timer? _timer;
  static StreamSubscription<Position>? _positionStream;
  static Position? _previousPosition;
  static double _distanceMeters = 0.0;
  static double _elevationGain = 0.0;
  static bool _isPaused = false;

  static void start() {
    print("GpsTrackingManager started");

    // Réinitialiser l'état
    FFAppState().update(() {
      FFAppState().durationSec = 0;
      FFAppState().totalDistance = 0.0;
      FFAppState().pathList = [];
      FFAppState().elevationGain = 0.0;
      FFAppState().currentElevationDiff = 0.0;
    });

    _distanceMeters = 0.0;
    _elevationGain = 0.0;
    _previousPosition = null;

    if (_isTracking) {
      print("Tracking déjà en cours");
      return;
    }
    _isTracking = true;
    // Timer
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      FFAppState().update(() => FFAppState().durationSec += 1);

      // Mise à jour vitesse moyenne
      if (FFAppState().durationSec > 0 && FFAppState().totalDistance > 0) {
        final hours = FFAppState().durationSec / 3600;
        final speed = FFAppState().totalDistance / hours;
        FFAppState().update(
            () => FFAppState().pace = double.parse(speed.toStringAsFixed(2)));
      }
    });

    // Abonnement GPS
    _positionStream = Geolocator.getPositionStream(
      locationSettings:
          LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 1),
    ).listen((Position pos) {
      if (_previousPosition == null) {
        _previousPosition = pos;
        FFAppState().addToPathList(LatLng(pos.latitude, pos.longitude));
        return;
      }

      final distance = Geolocator.distanceBetween(
        _previousPosition!.latitude,
        _previousPosition!.longitude,
        pos.latitude,
        pos.longitude,
      );

      // 🔒 Filtrage du bruit GPS (distance < 10m)
      if (distance < 10) {
        print("Mouvement ignoré (<10m)");
        return;
      }

      final timeDiff =
          pos.timestamp!.difference(_previousPosition!.timestamp!).inSeconds;

      // Mise à jour distance
      _distanceMeters += distance;
      // Distance totale (km)
      FFAppState().update(() => FFAppState().totalDistance =
          double.parse((_distanceMeters / 1000).toStringAsFixed(3)));

      // ➕ Dénivelé positif cumulé (filtré)
      final elevationDiff = pos.altitude - _previousPosition!.altitude;
      if (elevationDiff > 0.5) {
        _elevationGain += elevationDiff;
        FFAppState().update(() => FFAppState().elevationGain =
            double.parse(_elevationGain.toStringAsFixed(1)));
      }

      // Vitesse instantanée (si timeDiff cohérent)
      if (timeDiff > 0) {
        final instSpeed = (distance / timeDiff) * 3.6; // m/s → km/h
        FFAppState().update(() =>
            FFAppState().speedKmh = double.parse(instSpeed.toStringAsFixed(2)));

        // Liste pour graphe si besoin
        FFAppState().addToSpeedList(double.parse(instSpeed.toStringAsFixed(2)));
      }
      // Mise à jour de la position
      _previousPosition = pos;
      FFAppState().addToPathList(LatLng(pos.latitude, pos.longitude));
    }, onError: (e) {
      print("GPS Error: $e");
    });
  }

  //Arreter le tracking
  static Future<void> stop() async {
    await _positionStream?.cancel();
    _positionStream = null;
    _isTracking = false;

    _timer?.cancel();
    _timer = null;

    _previousPosition = null;
    _distanceMeters = 0.0;
    _elevationGain = 0.0;
  }

  //Mettre en pause le trakcing
  static Future<void> pause() async {
    print("GpsTrackingManager paused");
    _isPaused = true;
    _timer?.cancel();
    _positionStream?.pause();
  }

  //Redémarrer le tracking
  static Future<void> resume() async {
    if (!_isPaused) return; // sécurité pour éviter un double appel

    print("GpsTrackingManager resumed");
    _isPaused = false;

    // Redémarrer le timer
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      FFAppState().update(() => FFAppState().durationSec += 1);

      if (FFAppState().durationSec > 0 && FFAppState().totalDistance > 0) {
        final hours = FFAppState().durationSec / 3600;
        final speed = FFAppState().totalDistance / hours;
        FFAppState().update(
            () => FFAppState().pace = double.parse(speed.toStringAsFixed(2)));
      }
    });

    // Reprendre le stream GPS
    _positionStream?.resume();
  }
}
