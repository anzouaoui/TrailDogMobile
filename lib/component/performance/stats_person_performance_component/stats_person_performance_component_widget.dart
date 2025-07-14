import '/component/performance/sante_performance_component/sante_performance_component_widget.dart';
import '/component/performance/success_perfomance_component/success_perfomance_component_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'stats_person_performance_component_model.dart';
export 'stats_person_performance_component_model.dart';

class StatsPersonPerformanceComponentWidget extends StatefulWidget {
  const StatsPersonPerformanceComponentWidget({super.key});

  @override
  State<StatsPersonPerformanceComponentWidget> createState() =>
      _StatsPersonPerformanceComponentWidgetState();
}

class _StatsPersonPerformanceComponentWidgetState
    extends State<StatsPersonPerformanceComponentWidget>
    with TickerProviderStateMixin {
  late StatsPersonPerformanceComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatsPersonPerformanceComponentModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      unselectedLabelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      labelColor: FlutterFlowTheme.of(context).tertiary,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      unselectedBackgroundColor:
                          FlutterFlowTheme.of(context).alternate,
                      unselectedBorderColor:
                          FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      elevation: 0.0,
                      buttonMargin:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'zx8g2p1o' /* Weekly */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'okcjwgtb' /* Monthly */,
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.santePerformanceComponentModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: SantePerformanceComponentWidget(),
                            ),
                            wrapWithModel(
                              model: _model.successPerfomanceComponentModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: SuccessPerfomanceComponentWidget(),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.santePerformanceComponentModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: SantePerformanceComponentWidget(),
                            ),
                            wrapWithModel(
                              model: _model.successPerfomanceComponentModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: SuccessPerfomanceComponentWidget(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
