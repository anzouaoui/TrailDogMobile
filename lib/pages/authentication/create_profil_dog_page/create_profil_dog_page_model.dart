import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_profil_dog_page_widget.dart' show CreateProfilDogPageWidget;
import 'package:flutter/material.dart';

class CreateProfilDogPageModel
    extends FlutterFlowModel<CreateProfilDogPageWidget> {
  ///  Local state fields for this page.
  /// Sélection de la race
  String? selectedBreed;

  /// Autre race
  String? customBreed;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData2mc = false;
  FFUploadedFile uploadedLocalFile_uploadData2mc =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData2mc = '';

  // State field(s) for TextFieldDogName widget.
  FocusNode? textFieldDogNameFocusNode;
  TextEditingController? textFieldDogNameTextController;
  String? Function(BuildContext, String?)?
      textFieldDogNameTextControllerValidator;
  // State field(s) for DropDownBreed widget.
  String? dropDownBreedValue;
  FormFieldController<String>? dropDownBreedValueController;
  // State field(s) for TextFieldOtherBreed widget.
  FocusNode? textFieldOtherBreedFocusNode;
  TextEditingController? textFieldOtherBreedTextController;
  String? Function(BuildContext, String?)?
      textFieldOtherBreedTextControllerValidator;
  // State field(s) for DropDownDogGender widget.
  String? dropDownDogGenderValue;
  FormFieldController<String>? dropDownDogGenderValueController;
  // State field(s) for TextFieldAge widget.
  FocusNode? textFieldAgeFocusNode;
  TextEditingController? textFieldAgeTextController;
  String? Function(BuildContext, String?)? textFieldAgeTextControllerValidator;
  // State field(s) for TextFieldWeight widget.
  FocusNode? textFieldWeightFocusNode;
  TextEditingController? textFieldWeightTextController;
  String? Function(BuildContext, String?)?
      textFieldWeightTextControllerValidator;
  // State field(s) for DropDownActivity widget.
  String? dropDownActivityValue;
  FormFieldController<String>? dropDownActivityValueController;
  // State field(s) for DropDownExperience widget.
  String? dropDownExperienceValue;
  FormFieldController<String>? dropDownExperienceValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextFieldTattoo widget.
  FocusNode? textFieldTattooFocusNode;
  TextEditingController? textFieldTattooTextController;
  String? Function(BuildContext, String?)?
      textFieldTattooTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DogRecord? dogOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldDogNameFocusNode?.dispose();
    textFieldDogNameTextController?.dispose();

    textFieldOtherBreedFocusNode?.dispose();
    textFieldOtherBreedTextController?.dispose();

    textFieldAgeFocusNode?.dispose();
    textFieldAgeTextController?.dispose();

    textFieldWeightFocusNode?.dispose();
    textFieldWeightTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();

    textFieldTattooFocusNode?.dispose();
    textFieldTattooTextController?.dispose();
  }
}
