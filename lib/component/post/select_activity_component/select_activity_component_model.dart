import '/component/activity/activity_component/activity_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'select_activity_component_widget.dart'
    show SelectActivityComponentWidget;
import 'package:flutter/material.dart';

class SelectActivityComponentModel
    extends FlutterFlowModel<SelectActivityComponentWidget> {
  ///  Local state fields for this component.
  /// Activité sélectionné
  DocumentReference? activitySelected;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for ActivityComponent dynamic component.
  late FlutterFlowDynamicModels<ActivityComponentModel> activityComponentModels;

  @override
  void initState(BuildContext context) {
    activityComponentModels =
        FlutterFlowDynamicModels(() => ActivityComponentModel());
  }

  @override
  void dispose() {
    activityComponentModels.dispose();
  }
}
