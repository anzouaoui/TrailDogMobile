import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// Liste des points du trajet
  List<LatLng> _pathList = [];
  List<LatLng> get pathList => _pathList;
  set pathList(List<LatLng> value) {
    _pathList = value;
  }

  void addToPathList(LatLng value) {
    pathList.add(value);
  }

  void removeFromPathList(LatLng value) {
    pathList.remove(value);
  }

  void removeAtIndexFromPathList(int index) {
    pathList.removeAt(index);
  }

  void updatePathListAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    pathList[index] = updateFn(_pathList[index]);
  }

  void insertAtIndexInPathList(int index, LatLng value) {
    pathList.insert(index, value);
  }

  /// Distance du trajet
  double _totalDistance = 0.0;
  double get totalDistance => _totalDistance;
  set totalDistance(double value) {
    _totalDistance = value;
  }

  /// Timer du trajet
  int _timerMs = 0;
  int get timerMs => _timerMs;
  set timerMs(int value) {
    _timerMs = value;
  }

  bool _isStopwatchRunning = false;
  bool get isStopwatchRunning => _isStopwatchRunning;
  set isStopwatchRunning(bool value) {
    _isStopwatchRunning = value;
  }

  double _currentSpeed = 0.0;
  double get currentSpeed => _currentSpeed;
  set currentSpeed(double value) {
    _currentSpeed = value;
  }

  /// Allure moyenne
  double _averagePace = 0.0;
  double get averagePace => _averagePace;
  set averagePace(double value) {
    _averagePace = value;
  }

  /// Nombre de pas
  int _stepCount = 0;
  int get stepCount => _stepCount;
  set stepCount(int value) {
    _stepCount = value;
  }

  /// Gestion de la navbar
  int _selectedNavIndex = 0;
  int get selectedNavIndex => _selectedNavIndex;
  set selectedNavIndex(int value) {
    _selectedNavIndex = value;
  }

  /// Contrôle s'il y a au moins un message
  bool _haveMessage = false;
  bool get haveMessage => _haveMessage;
  set haveMessage(bool value) {
    _haveMessage = value;
  }

  /// permet de savoir si le message est lu
  bool _isRead = false;
  bool get isRead => _isRead;
  set isRead(bool value) {
    _isRead = value;
  }

  double _previousAltitude = 0.0;
  double get previousAltitude => _previousAltitude;
  set previousAltitude(double value) {
    _previousAltitude = value;
  }

  double _totalElevation = 0.0;
  double get totalElevation => _totalElevation;
  set totalElevation(double value) {
    _totalElevation = value;
  }

  /// Vérifier si le tracking est en pause ou pas
  bool _isTrackingPaused = false;
  bool get isTrackingPaused => _isTrackingPaused;
  set isTrackingPaused(bool value) {
    _isTrackingPaused = value;
  }

  int _StepCounterManager = 0;
  int get StepCounterManager => _StepCounterManager;
  set StepCounterManager(int value) {
    _StepCounterManager = value;
  }

  int _elapsedTime = 0;
  int get elapsedTime => _elapsedTime;
  set elapsedTime(int value) {
    _elapsedTime = value;
  }

  double _pace = 0.0;
  double get pace => _pace;
  set pace(double value) {
    _pace = value;
  }

  int _durationSec = 0;
  int get durationSec => _durationSec;
  set durationSec(int value) {
    _durationSec = value;
  }

  /// Dénivelé d'une activité
  double _elevationGain = 0.0;
  double get elevationGain => _elevationGain;
  set elevationGain(double value) {
    _elevationGain = value;
  }

  /// Si l'utilistateur est premimum ou pas
  bool _isPremium = false;
  bool get isPremium => _isPremium;
  set isPremium(bool value) {
    _isPremium = value;
  }

  /// Différence de dénivelé
  double _currentElevationDiff = 0.0;
  double get currentElevationDiff => _currentElevationDiff;
  set currentElevationDiff(double value) {
    _currentElevationDiff = value;
  }
}
