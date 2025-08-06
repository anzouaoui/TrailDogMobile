import '/components/subscription_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_page_widget.dart' show SettingsPageWidget;
import 'package:flutter/material.dart';

class SettingsPageModel extends FlutterFlowModel<SettingsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SubscriptionComponent component.
  late SubscriptionComponentModel subscriptionComponentModel;

  @override
  void initState(BuildContext context) {
    subscriptionComponentModel =
        createModel(context, () => SubscriptionComponentModel());
  }

  @override
  void dispose() {
    subscriptionComponentModel.dispose();
  }
}
