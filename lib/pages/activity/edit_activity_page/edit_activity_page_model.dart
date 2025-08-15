import '/component/dog_component/dog_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_activity_page_widget.dart' show EditActivityPageWidget;
import 'package:flutter/material.dart';

class EditActivityPageModel extends FlutterFlowModel<EditActivityPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Models for DogComponent dynamic component.
  late FlutterFlowDynamicModels<DogComponentModel> dogComponentModels;

  @override
  void initState(BuildContext context) {
    dogComponentModels = FlutterFlowDynamicModels(() => DogComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    dogComponentModels.dispose();
  }
}
