import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'friend_request_notification_component_model.dart';
export 'friend_request_notification_component_model.dart';

/// Composant notification d'une demande d'ami
class FriendRequestNotificationComponentWidget extends StatefulWidget {
  const FriendRequestNotificationComponentWidget({
    super.key,
    this.userformParamter,
    this.referenceFirendRequest,
    this.notificationParameter,
  });

  final DocumentReference? userformParamter;
  final String? referenceFirendRequest;
  final DocumentReference? notificationParameter;

  @override
  State<FriendRequestNotificationComponentWidget> createState() =>
      _FriendRequestNotificationComponentWidgetState();
}

class _FriendRequestNotificationComponentWidgetState
    extends State<FriendRequestNotificationComponentWidget> {
  late FriendRequestNotificationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => FriendRequestNotificationComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userformParamter!),
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

        final containerUsersRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Color(0xFFE3F2FD),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: StreamBuilder<NotificationsRecord>(
              stream: NotificationsRecord.getDocument(
                  widget.notificationParameter!),
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

                final rowNotificationsRecord = snapshot.data!;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent2,
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.person_add_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ew7sr2g4' /* New friend */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                dateTimeFormat(
                                  "relative",
                                  rowNotificationsRecord.createdAt!,
                                  locale: FFLocalizations.of(context)
                                          .languageShortCode ??
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '7ztoxo3p' /* Friend request by :  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  '${containerUsersRecord.firstname} ${containerUsersRecord.lastname}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  // récupération du document FriendRequest à partir du Documentid
                                  _model.friendRequestOutput =
                                      await queryFriendsRequestsRecordOnce(
                                    queryBuilder: (friendsRequestsRecord) =>
                                        friendsRequestsRecord.where(
                                      'uid',
                                      isEqualTo: widget.referenceFirendRequest,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);

                                  await _model.friendRequestOutput!.reference
                                      .update(createFriendsRequestsRecordData(
                                    status: 'Accepted',
                                  ));

                                  var friendsRecordReference1 =
                                      FriendsRecord.createDoc(
                                          _model.friendRequestOutput!.userTo!);
                                  await friendsRecordReference1
                                      .set(createFriendsRecordData(
                                    friendRef:
                                        _model.friendRequestOutput?.userFrom,
                                    since: getCurrentTimestamp,
                                  ));
                                  _model.friendToOutput =
                                      FriendsRecord.getDocumentFromData(
                                          createFriendsRecordData(
                                            friendRef: _model
                                                .friendRequestOutput?.userFrom,
                                            since: getCurrentTimestamp,
                                          ),
                                          friendsRecordReference1);

                                  await _model.friendToOutput!.reference
                                      .update(createFriendsRecordData(
                                    uid: _model.friendToOutput?.reference.id,
                                  ));

                                  var friendsRecordReference2 =
                                      FriendsRecord.createDoc(_model
                                          .friendRequestOutput!.userFrom!);
                                  await friendsRecordReference2
                                      .set(createFriendsRecordData(
                                    friendRef:
                                        _model.friendRequestOutput?.userTo,
                                    since: getCurrentTimestamp,
                                  ));
                                  _model.friendFromOutput =
                                      FriendsRecord.getDocumentFromData(
                                          createFriendsRecordData(
                                            friendRef: _model
                                                .friendRequestOutput?.userTo,
                                            since: getCurrentTimestamp,
                                          ),
                                          friendsRecordReference2);

                                  await _model.friendFromOutput!.friendRef!
                                      .update(createUsersRecordData(
                                    uid: _model.friendFromOutput?.reference.id,
                                  ));

                                  await widget.notificationParameter!
                                      .update(createNotificationsRecordData(
                                    read: true,
                                  ));

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'yx6obllz' /* Accept */,
                                ),
                                options: FFButtonOptions(
                                  height: 32.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  // récupération du document FriendRequest à partir du Documentid
                                  _model.friendRequestOutputCopy =
                                      await queryFriendsRequestsRecordOnce(
                                    queryBuilder: (friendsRequestsRecord) =>
                                        friendsRequestsRecord.where(
                                      'uid',
                                      isEqualTo: widget.referenceFirendRequest,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);

                                  await _model
                                      .friendRequestOutputCopy!.reference
                                      .update(createFriendsRequestsRecordData(
                                    status: 'Rejected',
                                  ));

                                  await widget.notificationParameter!
                                      .update(createNotificationsRecordData(
                                    read: true,
                                  ));

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'r3t3ez79' /* Refuse */,
                                ),
                                options: FFButtonOptions(
                                  height: 32.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
