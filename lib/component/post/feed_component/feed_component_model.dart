import '/component/post/feed_activity_compoennt/feed_activity_compoennt_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feed_component_widget.dart' show FeedComponentWidget;
import 'package:flutter/material.dart';

class FeedComponentModel extends FlutterFlowModel<FeedComponentWidget> {
  ///  Local state fields for this component.
  /// Gestion du toggle est aimé ou pas
  bool postIsLiked = false;

  ///  State fields for stateful widgets in this component.

  // Model for FeedActivityCompoennt component.
  late FeedActivityCompoenntModel feedActivityCompoenntModel;

  @override
  void initState(BuildContext context) {
    feedActivityCompoenntModel =
        createModel(context, () => FeedActivityCompoenntModel());
  }

  @override
  void dispose() {
    feedActivityCompoenntModel.dispose();
  }
}
