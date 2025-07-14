import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_profile_page_widget.dart' show CreateProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateProfilePageModel extends FlutterFlowModel<CreateProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData1mc = false;
  FFUploadedFile uploadedLocalFile_uploadData1mc =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData1mc = '';

  bool isDataUploading_profileUploaded = false;
  FFUploadedFile uploadedLocalFile_profileUploaded =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_profileUploaded = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  // State field(s) for birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateTextController;
  late MaskTextInputFormatter birthdateMask;
  String? Function(BuildContext, String?)? birthdateTextControllerValidator;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode1;
  TextEditingController? weightTextController1;
  String? Function(BuildContext, String?)? weightTextController1Validator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode2;
  TextEditingController? weightTextController2;
  String? Function(BuildContext, String?)? weightTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();

    birthdateFocusNode?.dispose();
    birthdateTextController?.dispose();

    weightFocusNode1?.dispose();
    weightTextController1?.dispose();

    weightFocusNode2?.dispose();
    weightTextController2?.dispose();
  }
}
