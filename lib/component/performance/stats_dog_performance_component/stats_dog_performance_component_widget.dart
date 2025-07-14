import '/component/performance/dog_activity_performance_component/dog_activity_performance_component_widget.dart';
import '/component/performance/sante_performance_component/sante_performance_component_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'stats_dog_performance_component_model.dart';
export 'stats_dog_performance_component_model.dart';

class StatsDogPerformanceComponentWidget extends StatefulWidget {
  const StatsDogPerformanceComponentWidget({super.key});

  @override
  State<StatsDogPerformanceComponentWidget> createState() =>
      _StatsDogPerformanceComponentWidgetState();
}

class _StatsDogPerformanceComponentWidgetState
    extends State<StatsDogPerformanceComponentWidget>
    with TickerProviderStateMixin {
  late StatsDogPerformanceComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatsDogPerformanceComponentModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'ddlmjk50' /* Border colie */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'dw2riaz9' /* Master of the mountains */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'hzu6vfut' /* Sprint specialty */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 4.0)).addToEnd(SizedBox(height: 16.0)),
            ),
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
                            'iadjy24o' /* Weekly */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'kt2vzf03' /* Monthly */,
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.santePerformanceComponentModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: SantePerformanceComponentWidget(),
                              ),
                              wrapWithModel(
                                model: _model
                                    .dogActivityPerformanceComponentModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: DogActivityPerformanceComponentWidget(),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.santePerformanceComponentModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: SantePerformanceComponentWidget(),
                              ),
                              wrapWithModel(
                                model: _model
                                    .dogActivityPerformanceComponentModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: DogActivityPerformanceComponentWidget(),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
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
