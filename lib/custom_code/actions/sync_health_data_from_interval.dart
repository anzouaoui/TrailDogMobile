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

import 'dart:io';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

Future<dynamic> syncHealthDataFromInterval(
  DateTime startTime,
  DateTime endTime,
) async {
  // Add your function code here!
  final health = Health();
  health.configure();

  final types = [
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.HEART_RATE,
  ];

  final permissions = types
      .map((type) =>
          Platform.isIOS ? HealthDataAccess.READ : HealthDataAccess.READ)
      .toList();

  if (Platform.isAndroid) {
    await Permission.activityRecognition.request();
    await Permission.location.request();
  }

  bool isAuthorized = false;
  try {
    isAuthorized = await health.requestAuthorization(
      types,
      permissions: permissions,
    );

    if (Platform.isAndroid && isAuthorized) {
      await health.requestHealthDataHistoryAuthorization();
      await health.requestHealthDataInBackgroundAuthorization();
    }
  } catch (e) {
    return {'error': 'Authorization error: $e'};
  }

  if (!isAuthorized) {
    return {'error': 'Access denied'};
  }

  try {
    List<HealthDataPoint> data = await health.getHealthDataFromTypes(
      types: types,
      startTime: startTime,
      endTime: endTime,
    );

    data = Health().removeDuplicates(data);

    double calories = 0;
    List<double> heartRates = [];

    for (final point in data) {
      final value = (point.value as num).toDouble();
      if (point.type == HealthDataType.ACTIVE_ENERGY_BURNED) {
        calories += value;
      } else if (point.type == HealthDataType.HEART_RATE) {
        heartRates.add(value);
      }
    }

    double heartRateAvg = heartRates.isNotEmpty
        ? heartRates.reduce((a, b) => a + b) / heartRates.length
        : 0;

    return {
      'calories': calories,
      'heart_rate_avg': heartRateAvg,
    };
  } catch (e) {
    return {'error': 'Data fetch error: $e'};
  }
}
