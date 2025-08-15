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
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> manageTrackingPermission() async {
  // Add your function code here!
  // 1) Service de localisation actif ?
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return false;
  }

  // 2) Permission de localisation
  LocationPermission loc = await Geolocator.checkPermission();
  if (loc == LocationPermission.denied) {
    loc = await Geolocator.requestPermission();
  }
  if (loc == LocationPermission.denied) {
    return false;
  }
  if (loc == LocationPermission.deniedForever) {
    await openAppSettings();
    return false;
  }

  // 3) (Android) Reconnaissance d’activité pour les pas
  bool activityGranted = true;
  if (Platform.isAndroid) {
    var activityStatus = await Permission.activityRecognition.status;

    if (activityStatus.isDenied) {
      activityStatus = await Permission.activityRecognition.request();
    } else if (activityStatus.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    activityGranted = activityStatus.isGranted;
  }

  // 4) Publier les flags UI (hors async)
  FFAppState().update(() {
    FFAppState().isLocationGranted = true;
    if (Platform.isAndroid) {
      FFAppState().isActivityGranted = activityGranted;
    }
  });

  return Platform.isAndroid ? activityGranted : true;
}
