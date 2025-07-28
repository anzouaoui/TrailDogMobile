import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ask_friends_component_model.dart';
export 'ask_friends_component_model.dart';

/// Composant de demande d'amis
class AskFriendsComponentWidget extends StatefulWidget {
  const AskFriendsComponentWidget({
    super.key,
    required this.userParameter,
  });

  /// utilisateur concerné
  final DocumentReference? userParameter;

  @override
  State<AskFriendsComponentWidget> createState() =>
      _AskFriendsComponentWidgetState();
}

class _AskFriendsComponentWidgetState extends State<AskFriendsComponentWidget> {
  late AskFriendsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AskFriendsComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userParameter!),
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
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48.0,
                    height: 48.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1608138404239-d2f557515ecb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NTExODAyNDF8&ixlib=rb-4.1.0&q=80&w=1080',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${containerUsersRecord.firstname} ${containerUsersRecord.lastname}',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.requestSended == false) {
                        return FFButtonWidget(
                          onPressed: () async {
                            var friendsRequestsRecordReference =
                                FriendsRequestsRecord.collection.doc();
                            await friendsRequestsRecordReference
                                .set(createFriendsRequestsRecordData(
                              userFrom: currentUserReference,
                              userTo: containerUsersRecord.reference,
                              status: 'Pending',
                              createdAt: getCurrentTimestamp,
                              uid: '',
                            ));
                            _model.friendsRequestOutput =
                                FriendsRequestsRecord.getDocumentFromData(
                                    createFriendsRequestsRecordData(
                                      userFrom: currentUserReference,
                                      userTo: containerUsersRecord.reference,
                                      status: 'Pending',
                                      createdAt: getCurrentTimestamp,
                                      uid: '',
                                    ),
                                    friendsRequestsRecordReference);

                            await _model.friendsRequestOutput!.reference
                                .update(createFriendsRequestsRecordData(
                              uid: _model.friendsRequestOutput?.reference.id,
                            ));
                            _model.requestSended = true;
                            safeSetState(() {});

                            var notificationsRecordReference =
                                NotificationsRecord.createDoc(
                                    _model.friendsRequestOutput!.userFrom!);
                            await notificationsRecordReference
                                .set(createNotificationsRecordData(
                              type: 'Friend request',
                              userTo: _model.friendsRequestOutput?.userTo,
                              userFrom: currentUserReference,
                              createdAt: getCurrentTimestamp,
                              read: false,
                              friendRequestId:
                                  _model.friendsRequestOutput?.reference,
                            ));
                            _model.notificationsOutput =
                                NotificationsRecord.getDocumentFromData(
                                    createNotificationsRecordData(
                                      type: 'Friend request',
                                      userTo:
                                          _model.friendsRequestOutput?.userTo,
                                      userFrom: currentUserReference,
                                      createdAt: getCurrentTimestamp,
                                      read: false,
                                      friendRequestId: _model
                                          .friendsRequestOutput?.reference,
                                    ),
                                    notificationsRecordReference);

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '7jalmnxd' /* Follow */,
                          ),
                          options: FFButtonOptions(
                            height: 36.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        );
                      } else {
                        return Text(
                          FFLocalizations.of(context).getText(
                            'nmanwo3z' /* Request sended */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        );
                      }
                    },
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ].divide(SizedBox(height: 8.0)).around(SizedBox(height: 8.0)),
          ),
        );
      },
    );
  }
}
