import '/component/performance/dog_activity_performance_component/dog_activity_performance_component_widget.dart';
import '/component/performance/sante_performance_component/sante_performance_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stats_dog_performance_component_widget.dart'
    show StatsDogPerformanceComponentWidget;
import 'package:flutter/material.dart';

class StatsDogPerformanceComponentModel
    extends FlutterFlowModel<StatsDogPerformanceComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for SantePerformanceComponent component.
  late SantePerformanceComponentModel santePerformanceComponentModel1;
  // Model for DogActivityPerformanceComponent component.
  late DogActivityPerformanceComponentModel
      dogActivityPerformanceComponentModel1;
  // Model for SantePerformanceComponent component.
  late SantePerformanceComponentModel santePerformanceComponentModel2;
  // Model for DogActivityPerformanceComponent component.
  late DogActivityPerformanceComponentModel
      dogActivityPerformanceComponentModel2;

  @override
  void initState(BuildContext context) {
    santePerformanceComponentModel1 =
        createModel(context, () => SantePerformanceComponentModel());
    dogActivityPerformanceComponentModel1 =
        createModel(context, () => DogActivityPerformanceComponentModel());
    santePerformanceComponentModel2 =
        createModel(context, () => SantePerformanceComponentModel());
    dogActivityPerformanceComponentModel2 =
        createModel(context, () => DogActivityPerformanceComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    santePerformanceComponentModel1.dispose();
    dogActivityPerformanceComponentModel1.dispose();
    santePerformanceComponentModel2.dispose();
    dogActivityPerformanceComponentModel2.dispose();
  }
}
