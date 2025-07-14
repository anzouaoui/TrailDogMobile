import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friend_request_notification_component_widget.dart'
    show FriendRequestNotificationComponentWidget;
import 'package:flutter/material.dart';

class FriendRequestNotificationComponentModel
    extends FlutterFlowModel<FriendRequestNotificationComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FriendsRequestsRecord? friendRequestOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FriendsRecord? friendToOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FriendsRecord? friendFromOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FriendsRequestsRecord? friendRequestOutputCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
