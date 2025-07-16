import '/component/post/view_comment_component/view_comment_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comments_component_widget.dart' show CommentsComponentWidget;
import 'package:flutter/material.dart';

class CommentsComponentModel extends FlutterFlowModel<CommentsComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for ViewCommentComponent dynamic component.
  late FlutterFlowDynamicModels<ViewCommentComponentModel>
      viewCommentComponentModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    viewCommentComponentModels =
        FlutterFlowDynamicModels(() => ViewCommentComponentModel());
  }

  @override
  void dispose() {
    viewCommentComponentModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
