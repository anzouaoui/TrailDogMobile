import '/component/navbar_component/navbar_component_widget.dart';
import '/component/profil_dog_component/profil_dog_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dogs_page_widget.dart' show DogsPageWidget;
import 'package:flutter/material.dart';

class DogsPageModel extends FlutterFlowModel<DogsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for ProfilDogComponent dynamic component.
  late FlutterFlowDynamicModels<ProfilDogComponentModel>
      profilDogComponentModels;
  // Model for NavbarComponent component.
  late NavbarComponentModel navbarComponentModel;

  @override
  void initState(BuildContext context) {
    profilDogComponentModels =
        FlutterFlowDynamicModels(() => ProfilDogComponentModel());
    navbarComponentModel = createModel(context, () => NavbarComponentModel());
  }

  @override
  void dispose() {
    profilDogComponentModels.dispose();
    navbarComponentModel.dispose();
  }
}
