import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_view_page_widget.dart' show ChatViewPageWidget;
import 'package:flutter/material.dart';

class ChatViewPageModel extends FlutterFlowModel<ChatViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  bool isDataUploading_mediaUploaded = false;
  FFUploadedFile uploadedLocalFile_mediaUploaded =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_mediaUploaded = '';

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? messageOutputCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? messageOutput;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
