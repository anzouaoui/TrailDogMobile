import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/activity/activity_component/activity_component_widget.dart';
import '/component/navbar_component/navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'activities_page_model.dart';
export 'activities_page_model.dart';

/// Listes des activités
class ActivitiesPageWidget extends StatefulWidget {
  const ActivitiesPageWidget({super.key});

  static String routeName = 'ActivitiesPage';
  static String routePath = '/activitiesPage';

  @override
  State<ActivitiesPageWidget> createState() => _ActivitiesPageWidgetState();
}

class _ActivitiesPageWidgetState extends State<ActivitiesPageWidget> {
  late ActivitiesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivitiesPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'i6hoavkh' /* Activity Feed */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: StreamBuilder<List<ActivityRecord>>(
                      stream: queryActivityRecord(
                        parent: currentUserReference,
                        queryBuilder: (activityRecord) => activityRecord
                            .orderBy('start_time', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ActivityRecord> columnActivityRecordList =
                            snapshot.data!;

                        return SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnActivityRecordList.length, (columnIndex) {
                              final columnActivityRecord =
                                  columnActivityRecordList[columnIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    ActivityPageWidget.routeName,
                                    queryParameters: {
                                      'activityParameter': serializeParam(
                                        columnActivityRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: wrapWithModel(
                                  model:
                                      _model.activityComponentModels.getModel(
                                    columnActivityRecord.reference.id,
                                    columnIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: ActivityComponentWidget(
                                    key: Key(
                                      'Keys9v_${columnActivityRecord.reference.id}',
                                    ),
                                    activityParameter:
                                        columnActivityRecord.reference,
                                  ),
                                ),
                              );
                            }).divide(SizedBox(height: 16.0)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navbarComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: NavbarComponentWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
