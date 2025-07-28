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

// Manage all permission (notifications, location, sensor, body sensor, storage)
import 'package:permission_handler/permission_handler.dart';

Future managePermission() async {
  // Request location permission
  PermissionStatus locationStatus = await Permission.location.request();
  FFAppState().isLocationGranted = locationStatus == PermissionStatus.granted;

  // Request notification permission
  PermissionStatus notificationStatus = await Permission.notification.request();
  FFAppState().isNotificationGranted =
      notificationStatus == PermissionStatus.granted;

  // Request camera permission
  PermissionStatus cameraStatus = await Permission.camera.request();
  FFAppState().isCameraGranted = cameraStatus == PermissionStatus.granted;

  // Request storage permission
  PermissionStatus storageStatus = await Permission.storage.request();
  FFAppState().isStorageGranted = storageStatus == PermissionStatus.granted;

  // Request sensors permission (body sensors)
  PermissionStatus sensorsStatus = await Permission.sensors.request();
  FFAppState().isSensorsGranted = sensorsStatus == PermissionStatus.granted;

  // Request activity recognition permission for step counting and fitness data
  PermissionStatus activityStatus =
      await Permission.activityRecognition.request();
  FFAppState().isActivityGranted = activityStatus == PermissionStatus.granted;

  // Update app state to notify listeners of permission changes
  FFAppState().update(() {});
}
