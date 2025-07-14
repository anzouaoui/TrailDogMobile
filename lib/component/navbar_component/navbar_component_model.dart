import '/flutter_flow/flutter_flow_util.dart';
import 'navbar_component_widget.dart' show NavbarComponentWidget;
import 'package:flutter/material.dart';

class NavbarComponentModel extends FlutterFlowModel<NavbarComponentWidget> {
  ///  Local state fields for this component.
  /// Contrôle le menu Accueil
  bool isHome = true;

  /// Contrôle le menu Explorer
  bool isExplorer = false;

  /// Contrôle le menu Track
  bool isTrack = false;

  /// Contrôle le menu Message
  bool isMessage = false;

  /// Contrôle le menu Profile
  bool isProfile = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
