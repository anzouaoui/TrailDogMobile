import '/component/activity/activity_component/activity_component_widget.dart';
import '/component/navbar_component/navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'activities_page_widget.dart' show ActivitiesPageWidget;
import 'package:flutter/material.dart';

class ActivitiesPageModel extends FlutterFlowModel<ActivitiesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for ActivityComponent dynamic component.
  late FlutterFlowDynamicModels<ActivityComponentModel> activityComponentModels;
  // Model for NavbarComponent component.
  late NavbarComponentModel navbarComponentModel;

  @override
  void initState(BuildContext context) {
    activityComponentModels =
        FlutterFlowDynamicModels(() => ActivityComponentModel());
    navbarComponentModel = createModel(context, () => NavbarComponentModel());
  }

  @override
  void dispose() {
    activityComponentModels.dispose();
    navbarComponentModel.dispose();
  }
}
