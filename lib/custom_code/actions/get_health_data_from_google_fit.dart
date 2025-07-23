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

Future<dynamic> getHealthDataFromGoogleFit() async {
  // Add your function code here!
  final types = [
    HealthDataType.HEART_RATE,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  final now = DateTime.now();
  final start = now.subtract(Duration(hours: 1)); // exemple : dernière heure

  final health = Health();

  // Demander permissions
  final hasPermissions = await health.requestAuthorization(types);
  if (!hasPermissions) throw Exception('Permission denied');

  // Récupérer les données
  final data = await health.getHealthDataFromTypes(
    types: types,
    startTime: start,
    endTime: now,
  );

  double totalCalories = 0.0;
  double avgHeartRate = 0.0;
  int heartRateCount = 0;

  for (final entry in data) {
    if (entry.type == HealthDataType.ACTIVE_ENERGY_BURNED) {
      totalCalories += (entry.value as num).toDouble();
    } else if (entry.type == HealthDataType.HEART_RATE) {
      avgHeartRate += (entry.value as num).toDouble();
      heartRateCount++;
    }
  }

  avgHeartRate = heartRateCount > 0 ? avgHeartRate / heartRateCount : 0.0;

  return {
    'calories': totalCalories,
    'avgHeartRate': avgHeartRate,
  };
}
