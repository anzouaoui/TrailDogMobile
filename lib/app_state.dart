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

  bool _isGoogleFitConnected = false;
  bool get isGoogleFitConnected => _isGoogleFitConnected;
  set isGoogleFitConnected(bool value) {
    _isGoogleFitConnected = value;
  }

  /// Fréquence cardiaque pendant l'activité
  double _liveAverageHR = 0.0;
  double get liveAverageHR => _liveAverageHR;
  set liveAverageHR(double value) {
    _liveAverageHR = value;
  }

  /// Calories consommées pendant l'activité
  double _liveCalories = 0.0;
  double get liveCalories => _liveCalories;
  set liveCalories(double value) {
    _liveCalories = value;
  }

  List<dynamic> _heartRateSeries = [];
  List<dynamic> get heartRateSeries => _heartRateSeries;
  set heartRateSeries(List<dynamic> value) {
    _heartRateSeries = value;
  }

  void addToHeartRateSeries(dynamic value) {
    heartRateSeries.add(value);
  }

  void removeFromHeartRateSeries(dynamic value) {
    heartRateSeries.remove(value);
  }

  void removeAtIndexFromHeartRateSeries(int index) {
    heartRateSeries.removeAt(index);
  }

  void updateHeartRateSeriesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    heartRateSeries[index] = updateFn(_heartRateSeries[index]);
  }

  void insertAtIndexInHeartRateSeries(int index, dynamic value) {
    heartRateSeries.insert(index, value);
  }

  /// Récupère la position actuelle
  LatLng? _currentPosition = LatLng(49.050966, 2.100645);
  LatLng? get currentPosition => _currentPosition;
  set currentPosition(LatLng? value) {
    _currentPosition = value;
  }

  /// Ville du premier point de l'activité
  String _cityPostion = '';
  String get cityPostion => _cityPostion;
  set cityPostion(String value) {
    _cityPostion = value;
  }

  /// Liste de dénivelé pour chaque point
  List<double> _pathAltitudes = [];
  List<double> get pathAltitudes => _pathAltitudes;
  set pathAltitudes(List<double> value) {
    _pathAltitudes = value;
  }

  void addToPathAltitudes(double value) {
    pathAltitudes.add(value);
  }

  void removeFromPathAltitudes(double value) {
    pathAltitudes.remove(value);
  }

  void removeAtIndexFromPathAltitudes(int index) {
    pathAltitudes.removeAt(index);
  }

  void updatePathAltitudesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    pathAltitudes[index] = updateFn(_pathAltitudes[index]);
  }

  void insertAtIndexInPathAltitudes(int index, double value) {
    pathAltitudes.insert(index, value);
  }

  /// Indique si l’utilisateur a autorisé l’accès à la localisation
  bool _isLocationGranted = false;
  bool get isLocationGranted => _isLocationGranted;
  set isLocationGranted(bool value) {
    _isLocationGranted = value;
  }

  /// Indique si l’accès à l’activité physique (pas, calories) est accordé
  bool _isActivityGranted = false;
  bool get isActivityGranted => _isActivityGranted;
  set isActivityGranted(bool value) {
    _isActivityGranted = value;
  }

  /// Indique si l’utilisateur a autorisé l’envoi de notifications
  bool _isNotificationGranted = false;
  bool get isNotificationGranted => _isNotificationGranted;
  set isNotificationGranted(bool value) {
    _isNotificationGranted = value;
  }

  /// Indique si l’utilisateur a autorisé l’accès à l’appareil photo
  bool _isCameraGranted = false;
  bool get isCameraGranted => _isCameraGranted;
  set isCameraGranted(bool value) {
    _isCameraGranted = value;
  }

  /// 	Indique si l’accès aux capteurs corporels est accordé (ex : santé)
  bool _isSensorsGranted = false;
  bool get isSensorsGranted => _isSensorsGranted;
  set isSensorsGranted(bool value) {
    _isSensorsGranted = value;
  }

  /// Indique si l’accès aux fichiers et contenus multimédias est autorisé
  bool _isStorageGranted = false;
  bool get isStorageGranted => _isStorageGranted;
  set isStorageGranted(bool value) {
    _isStorageGranted = value;
  }

  /// Activité sélectionné lors d'un post
  DocumentReference? _activitySelected;
  DocumentReference? get activitySelected => _activitySelected;
  set activitySelected(DocumentReference? value) {
    _activitySelected = value;
  }

  /// Vitesse en km/h
  double _speedKmh = 0.0;
  double get speedKmh => _speedKmh;
  set speedKmh(double value) {
    _speedKmh = value;
  }

  /// Liste des vitesses enregistré
  List<double> _speedList = [];
  List<double> get speedList => _speedList;
  set speedList(List<double> value) {
    _speedList = value;
  }

  void addToSpeedList(double value) {
    speedList.add(value);
  }

  void removeFromSpeedList(double value) {
    speedList.remove(value);
  }

  void removeAtIndexFromSpeedList(int index) {
    speedList.removeAt(index);
  }

  void updateSpeedListAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    speedList[index] = updateFn(_speedList[index]);
  }

  void insertAtIndexInSpeedList(int index, double value) {
    speedList.insert(index, value);
  }
}
