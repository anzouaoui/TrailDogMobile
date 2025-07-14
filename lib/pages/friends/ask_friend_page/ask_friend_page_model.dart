import '/component/friends/ask_friends_component/ask_friends_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ask_friend_page_widget.dart' show AskFriendPageWidget;
import 'package:flutter/material.dart';

class AskFriendPageModel extends FlutterFlowModel<AskFriendPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for AskFriendsComponent dynamic component.
  late FlutterFlowDynamicModels<AskFriendsComponentModel>
      askFriendsComponentModels;

  @override
  void initState(BuildContext context) {
    askFriendsComponentModels =
        FlutterFlowDynamicModels(() => AskFriendsComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    askFriendsComponentModels.dispose();
  }
}
