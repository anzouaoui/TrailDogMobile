import '/component/notification/friend_request_notification_component/friend_request_notification_component_widget.dart';
import '/component/notification/new_message_notification_component/new_message_notification_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notification_page_widget.dart' show NotificationPageWidget;
import 'package:flutter/material.dart';

class NotificationPageModel extends FlutterFlowModel<NotificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for FriendRequestNotificationComponent dynamic component.
  late FlutterFlowDynamicModels<FriendRequestNotificationComponentModel>
      friendRequestNotificationComponentModels;
  // Models for NewMessageNotificationComponent dynamic component.
  late FlutterFlowDynamicModels<NewMessageNotificationComponentModel>
      newMessageNotificationComponentModels;

  @override
  void initState(BuildContext context) {
    friendRequestNotificationComponentModels = FlutterFlowDynamicModels(
        () => FriendRequestNotificationComponentModel());
    newMessageNotificationComponentModels =
        FlutterFlowDynamicModels(() => NewMessageNotificationComponentModel());
  }

  @override
  void dispose() {
    friendRequestNotificationComponentModels.dispose();
    newMessageNotificationComponentModels.dispose();
  }
}
