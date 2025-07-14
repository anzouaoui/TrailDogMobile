import '/component/friends/friend_request_component/friend_request_component_widget.dart';
import '/component/friends/friends_compoennt/friends_compoennt_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'friends_page_widget.dart' show FriendsPageWidget;
import 'package:flutter/material.dart';

class FriendsPageModel extends FlutterFlowModel<FriendsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for FriendsCompoennt dynamic component.
  late FlutterFlowDynamicModels<FriendsCompoenntModel> friendsCompoenntModels;
  // Models for FriendRequestComponent dynamic component.
  late FlutterFlowDynamicModels<FriendRequestComponentModel>
      friendRequestComponentModels;

  @override
  void initState(BuildContext context) {
    friendsCompoenntModels =
        FlutterFlowDynamicModels(() => FriendsCompoenntModel());
    friendRequestComponentModels =
        FlutterFlowDynamicModels(() => FriendRequestComponentModel());
  }

  @override
  void dispose() {
    friendsCompoenntModels.dispose();
    friendRequestComponentModels.dispose();
  }
}
