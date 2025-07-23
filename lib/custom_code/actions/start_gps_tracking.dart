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

  // Réinitialisation des valeurs d'activité
  FFAppState().update(() {
    FFAppState().durationSec = 0;
    FFAppState().elevationGain = 0.0;
    FFAppState().currentElevationDiff = 0.0;
    FFAppState().totalDistance = 0.0;
  });

  // Démarrage du timer de durée (total brut)
  trackingTimer = Timer.periodic(Duration(seconds: 1), (_) {
    FFAppState().update(() => FFAppState().durationSec += 1);
  });

  // Vérification des permissions
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
      accuracy: LocationAccuracy.bestForNavigation, // meilleure précision
      distanceFilter: 5, // on évite les points trop rapprochés
    ),
  ).listen((Position position) {
    final currentLatLng = LatLng(position.latitude, position.longitude);
    final currentAltitude = double.parse(position.altitude.toStringAsFixed(1));
    final currentSpeed = position.speed; // m/s
    final gpsAccuracy = position.accuracy; // en mètres

    // Premier point
    if (previousPosition == null) {
      previousPosition = position;
      FFAppState().addToPathList(currentLatLng);
      FFAppState().addToPathAltitudes(currentAltitude);
      return;
    }

    final distanceInMeters = Geolocator.distanceBetween(
      previousPosition!.latitude,
      previousPosition!.longitude,
      position.latitude,
      position.longitude,
    );

    // CONDITIONS DE VALIDITÉ :
    // - distance ≥ 5 m
    // - vitesse ≥ 0.5 m/s (~1.8 km/h)
    // - précision GPS ≤ 20 m
    if (distanceInMeters >= 5 && currentSpeed > 0.5 && gpsAccuracy <= 20) {
      // 🔹 Distance
      distance += distanceInMeters;
      final distanceInKm = distance / 1000.0;
      FFAppState().update(() => FFAppState().totalDistance =
          double.parse(distanceInKm.toStringAsFixed(3)));

      // 🔹 Tracé
      FFAppState().addToPathList(currentLatLng);
      FFAppState().addToPathAltitudes(currentAltitude);

      // 🔹 Dénivelé
      final elevationDiff = position.altitude - previousPosition!.altitude;
      FFAppState().update(() => FFAppState().currentElevationDiff =
          double.parse(elevationDiff.toStringAsFixed(1)));

      if (elevationDiff > 0) {
        totalElevationGain += elevationDiff;
        FFAppState().update(() => FFAppState().elevationGain =
            double.parse(totalElevationGain.toStringAsFixed(1)));
      }

      // Mise à jour de la position précédente
      previousPosition = position;
    }
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
