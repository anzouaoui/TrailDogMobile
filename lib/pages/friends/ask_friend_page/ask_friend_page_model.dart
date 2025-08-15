import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ask_friend_page_widget.dart' show AskFriendPageWidget;
import 'package:flutter/material.dart';

class AskFriendPageModel extends FlutterFlowModel<AskFriendPageWidget> {
  ///  Local state fields for this page.
  /// si la demande est envoyé
  bool requestSended = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FriendsRequestsRecord? friendsRequestOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationsRecord? notificationsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
