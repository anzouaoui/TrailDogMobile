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

import 'package:geolocator/geolocator.dart';
import 'dart:async';

double distance = 0.0;
Timer? trackingTimer;
DateTime? previousTimestamp;
StreamSubscription? gpsTrackingSubscription;
double totalElevationGain = 0.0;

Future startGpsTracking() async {
  LocationPermission permission = await Geolocator.checkPermission();

  FFAppState().update(() => FFAppState().durationSec = 0);
  FFAppState().update(() => FFAppState().elevationGain = 0.0);
  FFAppState().update(() => FFAppState().currentElevationDiff = 0.0);

  // Démarrer le timer
  trackingTimer = Timer.periodic(Duration(seconds: 1), (_) {
    FFAppState().update(() => FFAppState().durationSec += 1);
  });

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      throw Exception('Permission GPS refusée');
    }
  }

  Position? previousPosition;

  gpsTrackingSubscription = Geolocator.getPositionStream(
    locationSettings: LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1,
    ),
  ).listen((Position position) {
    if (previousPosition == null) {
      previousPosition = position;
      FFAppState().addToPathList(LatLng(position.latitude, position.longitude));
      FFAppState().update(() => FFAppState().totalDistance = 0.0);
      return;
    }

    // Cilceul de distance
    double distanceInMeters = Geolocator.distanceBetween(
      previousPosition!.latitude,
      previousPosition!.longitude,
      position.latitude,
      position.longitude,
    );

    //Calcul de dénivelé
    if (distanceInMeters >= 5) {
      // Dénivelé instantané
      double elevationDiff = position.altitude - previousPosition!.altitude;
      FFAppState().update(() => FFAppState().currentElevationDiff =
          double.parse(elevationDiff.toStringAsFixed(1)));

      // Dénivelé positif cumulé
      if (elevationDiff > 0) {
        totalElevationGain += elevationDiff;
        FFAppState().update(() => FFAppState().elevationGain =
            double.parse(totalElevationGain.toStringAsFixed(1)));
      }
    }

    if (distanceInMeters >= 5) {
      FFAppState().addToPathList(LatLng(position.latitude, position.longitude));
      distance += distanceInMeters;
      double distanceInKm = distance / 1000.0;
      FFAppState().update(() => FFAppState().totalDistance =
          double.parse(distanceInKm.toStringAsFixed(3)));
      previousPosition = position;
    }
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
