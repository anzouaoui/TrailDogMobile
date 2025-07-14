import '/component/navbar_component/navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'activity_page_widget.dart' show ActivityPageWidget;
import 'package:flutter/material.dart';

class ActivityPageModel extends FlutterFlowModel<ActivityPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for NavbarComponent component.
  late NavbarComponentModel navbarComponentModel;

  @override
  void initState(BuildContext context) {
    navbarComponentModel = createModel(context, () => NavbarComponentModel());
  }

  @override
  void dispose() {
    navbarComponentModel.dispose();
  }
}
