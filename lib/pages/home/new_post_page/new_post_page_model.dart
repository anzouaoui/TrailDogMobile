import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_post_page_widget.dart' show NewPostPageWidget;
import 'package:flutter/material.dart';

class NewPostPageModel extends FlutterFlowModel<NewPostPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData8el = false;
  FFUploadedFile uploadedLocalFile_uploadData8el =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData8el = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostsRecord? newPostOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
