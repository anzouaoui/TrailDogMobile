import '/component/performance/stats_dog_performance_component/stats_dog_performance_component_widget.dart';
import '/component/performance/stats_person_performance_component/stats_person_performance_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'performance_page_widget.dart' show PerformancePageWidget;
import 'package:flutter/material.dart';

class PerformancePageModel extends FlutterFlowModel<PerformancePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for StatsPersonPerformanceComponent.
  late StatsPersonPerformanceComponentModel
      statsPersonPerformanceComponentModel;
  // Model for StatsDogPerformanceComponent component.
  late StatsDogPerformanceComponentModel statsDogPerformanceComponentModel1;
  // Model for StatsDogPerformanceComponent component.
  late StatsDogPerformanceComponentModel statsDogPerformanceComponentModel2;

  @override
  void initState(BuildContext context) {
    statsPersonPerformanceComponentModel =
        createModel(context, () => StatsPersonPerformanceComponentModel());
    statsDogPerformanceComponentModel1 =
        createModel(context, () => StatsDogPerformanceComponentModel());
    statsDogPerformanceComponentModel2 =
        createModel(context, () => StatsDogPerformanceComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    statsPersonPerformanceComponentModel.dispose();
    statsDogPerformanceComponentModel1.dispose();
    statsDogPerformanceComponentModel2.dispose();
  }
}
