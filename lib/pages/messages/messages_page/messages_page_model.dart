import '/component/messages/chat_list_component/chat_list_component_widget.dart';
import '/component/navbar_component/navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'messages_page_widget.dart' show MessagesPageWidget;
import 'package:flutter/material.dart';

class MessagesPageModel extends FlutterFlowModel<MessagesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavbarComponent component.
  late NavbarComponentModel navbarComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for ChatListComponent dynamic component.
  late FlutterFlowDynamicModels<ChatListComponentModel> chatListComponentModels;

  @override
  void initState(BuildContext context) {
    navbarComponentModel = createModel(context, () => NavbarComponentModel());
    chatListComponentModels =
        FlutterFlowDynamicModels(() => ChatListComponentModel());
  }

  @override
  void dispose() {
    navbarComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    chatListComponentModels.dispose();
  }
}
