import 'dart:async';
import 'package:pedometer/pedometer.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StepCounterManager {
  static StreamSubscription<StepCount>? _stepCountStream;
  static int? _initialSteps;

  static void start() {
    print("StepCounterManager started");
    _stepCountStream = Pedometer.stepCountStream.listen(
      (StepCount event) {
        print("Step event reçu: ${event.steps}");
        if (_initialSteps == null) {
          _initialSteps = event.steps;
          FFAppState().update(() => FFAppState().stepCount = 0);
        } else {
          final steps = event.steps - _initialSteps!;
          FFAppState().update(() => FFAppState().stepCount = steps);
        }
      },
      onError: (err) => print("Erreur pedometer: $err"),
      cancelOnError: true,
    );
  }

  static Future<void> stop() async {
    await _stepCountStream?.cancel();
    _stepCountStream = null;
    _initialSteps = null;
  }
}
