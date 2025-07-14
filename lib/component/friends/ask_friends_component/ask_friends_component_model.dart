import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ask_friends_component_widget.dart' show AskFriendsComponentWidget;
import 'package:flutter/material.dart';

class AskFriendsComponentModel
    extends FlutterFlowModel<AskFriendsComponentWidget> {
  ///  Local state fields for this component.
  /// Confirme l'envoie de la requete
  bool requestSended = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FriendsRequestsRecord? friendsRequestOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationsRecord? notificationsOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
