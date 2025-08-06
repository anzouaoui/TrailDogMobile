import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Récupérer le documentReference d'un user
DocumentReference getOtherUserRef(
  List<DocumentReference> users,
  DocumentReference currentUser,
) {
  for (final user in users) {
    if (user != currentUser) {
      return user as DocumentReference;
    }
  }
  return currentUser; // fallback (au cas où)
}

/// Durée, en heure, minutes et secondes
String? formatDurationToHMS(int durationSec) {
  final duration = Duration(seconds: durationSec);
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$hours:$minutes:$seconds';
}

/// Récupérer la ville à partir du résultat de l'API getCity
String extractCityFromComponents(dynamic apiResponse) {
  final results = apiResponse['results'];
  if (results != null && results is List) {
    for (final result in results) {
      final components = result['address_components'];
      if (components != null && components is List) {
        for (final component in components) {
          final types = component['types'];
          if (types != null && types is List && types.contains('locality')) {
            return component['long_name'] ?? '';
          }
        }
      }
    }
  }
  return '';
}

/// Récupérer la latitude d'un point
double getLatitude(LatLng position) {
  // gat latitude to a position LatLng
  return position.latitude;
}

/// Récupérer la longitude d'un point
double getLongitude(LatLng position) {
  // get longitude to a position LatLng
  return position.longitude;
}
