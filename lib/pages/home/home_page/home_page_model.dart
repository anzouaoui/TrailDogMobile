import '/component/navbar_component/navbar_component_widget.dart';
import '/component/post/feed_component/feed_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for FeedComponent dynamic component.
  late FlutterFlowDynamicModels<FeedComponentModel> feedComponentModels;
  // Model for NavbarComponent component.
  late NavbarComponentModel navbarComponentModel;

  @override
  void initState(BuildContext context) {
    feedComponentModels = FlutterFlowDynamicModels(() => FeedComponentModel());
    navbarComponentModel = createModel(context, () => NavbarComponentModel());
  }

  @override
  void dispose() {
    feedComponentModels.dispose();
    navbarComponentModel.dispose();
  }
}
