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

DateTime stringToDateTime(String dateString) {
  return DateTime.parse(dateString);
}

String formatMilliseconds(int ms) {
  Duration d = Duration(milliseconds: ms);

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  int hours = d.inHours;
  int minutes = d.inMinutes.remainder(60);
  int seconds = d.inSeconds.remainder(60);

  if (hours == 0) {
    // Affiche MM:SS min
    return '${twoDigits(minutes)}:${twoDigits(seconds)} min';
  } else {
    // Affiche HH:MM h
    return '${twoDigits(hours)}:${twoDigits(minutes)} h';
  }
}

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

String? formatDurationToHMS(int durationSec) {
  final duration = Duration(seconds: durationSec);
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$hours:$minutes:$seconds';
}
