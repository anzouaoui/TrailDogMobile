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

import 'package:health/health.dart';

Future<bool?> connectGoogleFit() async {
  // Add your function code here!

  final types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  final permissions = types.map((e) => HealthDataAccess.READ).toList();
  final health = Health();

  bool authorized =
      await health.requestAuthorization(types, permissions: permissions);
  return authorized;
}
