import 'dart:async';
import 'package:pedometer/pedometer.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Compteur de pas « session »
/// - baseline = première valeur reçue
/// - excludedDuringPause = pas faits pendant les pauses (soustraits à la reprise)
class StepCounterManager {
  static StreamSubscription<StepCount>? _sub;

  static bool _started = false;
  static bool _paused = false;

  // Valeurs brutes du capteur (cumul global depuis boot)
  static int? _baseline; // premières steps reçues à start()
  static int? _lastSteps; // dernière valeur brute vue

  // Gestion de la pause
  static int _excludedDuringPause = 0; // pas à ignorer (faits en pause)
  static int? _pauseStartSteps; // valeur brute au moment de la pause

  /// Démarrer le compteur de pas pour la session
  static void start() {
    if (_started) {
      print('[StepCounter] start() ignoré: déjà démarré.');
      return;
    }
    print('[StepCounter] start()');

    // Reset état de session
    _started = true;
    _paused = false;
    _baseline = null;
    _lastSteps = null;
    _excludedDuringPause = 0;
    _pauseStartSteps = null;

    // Remet l’UI à 0
    FFAppState().update(() => FFAppState().stepCount = 0);

    _sub = Pedometer.stepCountStream.listen(
      (StepCount ev) {
        final int value = ev.steps;
        _lastSteps = value;

        // Premier event = baseline
        if (_baseline == null) {
          _baseline = value;
          print('[StepCounter] baseline=$value');
          return;
        }

        // Si on est en pause: on ne pousse rien, mais on garde la trace des valeurs
        if (_paused) {
          // rien à faire ici; _pauseStartSteps est fixé dans pause()
          // _lastSteps continue de se mettre à jour
          return;
        }

        // Pas « bruts » de la session = (actuels - baseline)
        int rawSession = value - (_baseline ?? value);

        // Retirer les pas accumulés pendant les pauses précédentes
        int effective = rawSession - _excludedDuringPause;
        if (effective < 0) effective = 0;

        FFAppState().update(() => FFAppState().stepCount = effective);

        // Debug utile
        // print('[StepCounter] rawSession=$rawSession, excluded=$_excludedDuringPause, shown=$effective');
      },
      onError: (err) => print('[StepCounter] Erreur stream: $err'),
      cancelOnError: false,
    );
  }

  /// Mettre en pause (ignore les pas faits pendant la pause)
  static void pause() {
    if (!_started || _paused) return;
    _paused = true;
    _pauseStartSteps = _lastSteps; // snapshot à l’instant de la pause
    print('[StepCounter] pause() à steps=$_pauseStartSteps');
  }

  /// Reprendre: ajoute les pas faits pendant la pause à la « blacklist »
  static void resume() {
    if (!_started || !_paused) return;
    _paused = false;

    // Si on a des valeurs valides, calcule combien de pas ont été faits en pause
    if (_pauseStartSteps != null && _lastSteps != null) {
      final delta = _lastSteps! - _pauseStartSteps!;
      if (delta > 0) {
        _excludedDuringPause += delta;
        print(
            '[StepCounter] resume() -> exclude +$delta (total=$_excludedDuringPause)');
      }
    }
    _pauseStartSteps = null;

    // À la reprise, on « tick » immédiatement en recalculant le count via _lastSteps
    if (_baseline != null && _lastSteps != null) {
      int rawSession = _lastSteps! - _baseline!;
      int effective = rawSession - _excludedDuringPause;
      if (effective < 0) effective = 0;
      FFAppState().update(() => FFAppState().stepCount = effective);
    }
  }

  /// Arrêter le compteur
  static Future<void> stop() async {
    print('[StepCounter] stop()');
    await _sub?.cancel();
    _sub = null;

    _started = false;
    _paused = false;
    _baseline = null;
    _lastSteps = null;
    _pauseStartSteps = null;
    _excludedDuringPause = 0;

    // On ne remet pas stepCount à 0 ici pour permettre de persister la valeur finale
    // (tu la lis dans ton flow Stop avant d’éventuels resets UI).
  }
}
