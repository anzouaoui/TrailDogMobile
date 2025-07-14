import '/component/performance/sante_performance_component/sante_performance_component_widget.dart';
import '/component/performance/success_perfomance_component/success_perfomance_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stats_person_performance_component_widget.dart'
    show StatsPersonPerformanceComponentWidget;
import 'package:flutter/material.dart';

class StatsPersonPerformanceComponentModel
    extends FlutterFlowModel<StatsPersonPerformanceComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for SantePerformanceComponent component.
  late SantePerformanceComponentModel santePerformanceComponentModel1;
  // Model for SuccessPerfomanceComponent component.
  late SuccessPerfomanceComponentModel successPerfomanceComponentModel1;
  // Model for SantePerformanceComponent component.
  late SantePerformanceComponentModel santePerformanceComponentModel2;
  // Model for SuccessPerfomanceComponent component.
  late SuccessPerfomanceComponentModel successPerfomanceComponentModel2;

  @override
  void initState(BuildContext context) {
    santePerformanceComponentModel1 =
        createModel(context, () => SantePerformanceComponentModel());
    successPerfomanceComponentModel1 =
        createModel(context, () => SuccessPerfomanceComponentModel());
    santePerformanceComponentModel2 =
        createModel(context, () => SantePerformanceComponentModel());
    successPerfomanceComponentModel2 =
        createModel(context, () => SuccessPerfomanceComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    santePerformanceComponentModel1.dispose();
    successPerfomanceComponentModel1.dispose();
    santePerformanceComponentModel2.dispose();
    successPerfomanceComponentModel2.dispose();
  }
}
