import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/component/dog_select_component/dog_select_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'track_page_widget.dart' show TrackPageWidget;
import 'package:flutter/material.dart';

class TrackPageModel extends FlutterFlowModel<TrackPageWidget> {
  ///  Local state fields for this page.

  bool isSelecteDogPageState = false;

  bool isTimerRunning = false;

  bool isTimerPause = false;

  DateTime? startTime;

  DateTime? endTime;

  DocumentReference? currentActivity;

  List<DocumentReference> dogsSelected = [];
  void addToDogsSelected(DocumentReference item) => dogsSelected.add(item);
  void removeFromDogsSelected(DocumentReference item) =>
      dogsSelected.remove(item);
  void removeAtIndexFromDogsSelected(int index) => dogsSelected.removeAt(index);
  void insertAtIndexInDogsSelected(int index, DocumentReference item) =>
      dogsSelected.insert(index, item);
  void updateDogsSelectedAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      dogsSelected[index] = updateFn(dogsSelected[index]);

  List<LatLng> pathList = [];
  void addToPathList(LatLng item) => pathList.add(item);
  void removeFromPathList(LatLng item) => pathList.remove(item);
  void removeAtIndexFromPathList(int index) => pathList.removeAt(index);
  void insertAtIndexInPathList(int index, LatLng item) =>
      pathList.insert(index, item);
  void updatePathListAtIndex(int index, Function(LatLng) updateFn) =>
      pathList[index] = updateFn(pathList[index]);

  double? previousLat = 0.0;

  double? previousLng = 0.0;

  String? dogName;

  bool isTracking = false;

  /// Moyenne de fréquence cardiaque pendant l'activité
  double liveAverageHR = 0.0;

  /// Calories consommé pendant l'activité
  double liveCalories = 0.0;

  List<dynamic> heartRateSeries = [];
  void addToHeartRateSeries(dynamic item) => heartRateSeries.add(item);
  void removeFromHeartRateSeries(dynamic item) => heartRateSeries.remove(item);
  void removeAtIndexFromHeartRateSeries(int index) =>
      heartRateSeries.removeAt(index);
  void insertAtIndexInHeartRateSeries(int index, dynamic item) =>
      heartRateSeries.insert(index, item);
  void updateHeartRateSeriesAtIndex(int index, Function(dynamic) updateFn) =>
      heartRateSeries[index] = updateFn(heartRateSeries[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDownTypeActivite widget.
  String? dropDownTypeActiviteValue;
  FormFieldController<String>? dropDownTypeActiviteValueController;
  // Models for DogSelectComponent dynamic component.
  late FlutterFlowDynamicModels<DogSelectComponentModel>
      dogSelectComponentModels;
  // Stores action output result for [Backend Call - API (getCity)] action in Button widget.
  ApiCallResponse? cityOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? newActivityOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  BadgesRecord? badgeFirstActivityOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersBadgeRecord? checkUserBadgesOutput;

  @override
  void initState(BuildContext context) {
    dogSelectComponentModels =
        FlutterFlowDynamicModels(() => DogSelectComponentModel());
  }

  @override
  void dispose() {
    dogSelectComponentModels.dispose();
  }
}
