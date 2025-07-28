import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/activity/activity_component/activity_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_activity_component_model.dart';
export 'select_activity_component_model.dart';

/// Create a FlutterFlow component named "ActivitySelector".
///
/// It should display a horizontal scrollable row (ListView Horizontal or
/// Wrap) with a list of rounded buttons. Each button represents an activity,
/// and when tapped, it updates the selected activity and highlights the
/// selected button.
///
/// Include the following activity buttons:
/// 1. Canicross – icon: dog
/// 2. Randonnée – icon: terrain
/// 3. VTT – icon: bike
/// 4. Running – icon: directions_run
/// 5. Ski – icon: ac_unit
///
/// Styling for each button:
/// - Rounded corners
/// - Padding inside
/// - Background color changes when selected (green when selected, light grey
/// when not)
/// - Text label below the icon
///
/// Behavior:
/// - When a button is tapped, the component stores the selected activity
/// internally.
/// - The currently selected activity is exposed as a `selectedActivity`
/// output parameter (String).
/// - Optional input parameter `initialActivity` to preset a selected value
/// when loaded.
///
/// Font: use clean sans-serif (Roboto or similar). Layout should be
/// mobile-optimized and compact.
///
/// Do not include any actions or Firebase logic inside the component. It
/// should only handle UI and internal state management.
class SelectActivityComponentWidget extends StatefulWidget {
  const SelectActivityComponentWidget({super.key});

  @override
  State<SelectActivityComponentWidget> createState() =>
      _SelectActivityComponentWidgetState();
}

class _SelectActivityComponentWidgetState
    extends State<SelectActivityComponentWidget> {
  late SelectActivityComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectActivityComponentModel());
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
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'pivkftf0' /* Select Activity */,
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData(
                            FFLocalizations.of(context).getText(
                              'jh43i2ux' /* Cani-cross */,
                            ),
                            Icons.directions_run),
                        ChipData(
                            FFLocalizations.of(context).getText(
                              'c9fg6ezc' /* Cani-VTT */,
                            ),
                            FontAwesomeIcons.biking),
                        ChipData(
                            FFLocalizations.of(context).getText(
                              'ulj1jzpg' /* cani-hicking */,
                            ),
                            Icons.hiking)
                      ],
                      onChanged: (val) => safeSetState(
                          () => _model.choiceChipsValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        iconColor: FlutterFlowTheme.of(context).info,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 8.0,
                      rowSpacing: 8.0,
                      multiselect: false,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                      wrapped: true,
                    ),
                  ),
                ),
                StreamBuilder<List<ActivityRecord>>(
                  stream: queryActivityRecord(
                    parent: currentUserReference,
                    queryBuilder: (activityRecord) => activityRecord.where(
                      'activity_type',
                      isEqualTo: _model.choiceChipsValue,
                    ),
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
                    List<ActivityRecord> listViewActivityRecordList =
                        snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewActivityRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 8.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewActivityRecord =
                            listViewActivityRecordList[listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().activitySelected =
                                listViewActivityRecord.reference;
                            safeSetState(() {});
                            Navigator.pop(context);
                          },
                          child: wrapWithModel(
                            model: _model.activityComponentModels.getModel(
                              listViewActivityRecord.reference.id,
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: ActivityComponentWidget(
                              key: Key(
                                'Keyqj1_${listViewActivityRecord.reference.id}',
                              ),
                              activityParameter:
                                  listViewActivityRecord.reference,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
