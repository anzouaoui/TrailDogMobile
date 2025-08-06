import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'paywall_page_widget.dart' show PaywallPageWidget;
import 'package:flutter/material.dart';

class PaywallPageModel extends FlutterFlowModel<PaywallPageWidget> {
  ///  Local state fields for this page.
  /// Abonnement sélectionné
  String selectedPlan = 'monthly';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? purchaseMonthlyOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
