// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//import '/custom_code/gps_tracking_manager.dart';

Future stopGpsTracking() async {
  StreamSubscription? gpsTrackingSubscription;
  if (gpsTrackingSubscription != null) {
    await gpsTrackingSubscription!.cancel();
    gpsTrackingSubscription = null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
