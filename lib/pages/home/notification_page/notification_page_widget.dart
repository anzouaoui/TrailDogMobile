import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/notification/friend_request_notification_component/friend_request_notification_component_widget.dart';
import '/component/notification/new_message_notification_component/new_message_notification_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_page_model.dart';
export 'notification_page_model.dart';

/// Page de notifications sociales pour une application sportive canine.
///
/// - Affiche les notifications liées à l’activité de l’utilisateur :
///   - Demandes d’amis reçues
///   - Nouveaux messages reçus
///   - Likes sur ses activités partagées
///   - Commentaires sur ses activités
///   - Nouveaux événements (ex : randonnées, cani-cross à venir)
///
/// - Design moderne, clair et responsive :
///   - Cartes ou containers arrondis
///   - Espacement confortable
///   - Différenciation visuelle par type (icône/couleur secondaire)
///
/// - UI cohérente avec le reste de l’application TrailDog.
class NotificationPageWidget extends StatefulWidget {
  const NotificationPageWidget({super.key});

  static String routeName = 'NotificationPage';
  static String routePath = '/notificationPage';

  @override
  State<NotificationPageWidget> createState() => _NotificationPageWidgetState();
}

class _NotificationPageWidgetState extends State<NotificationPageWidget> {
  late NotificationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationPageModel());
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'gbhdjmlx' /* Notifications */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                  StreamBuilder<List<NotificationsRecord>>(
                    stream: queryNotificationsRecord(
                      queryBuilder: (notificationsRecord) => notificationsRecord
                          .where(
                            'user_to',
                            isEqualTo: currentUserReference,
                          )
                          .where(
                            'read',
                            isEqualTo: false,
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
                      List<NotificationsRecord>
                          listViewNotificationsRecordList = snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewNotificationsRecordList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 8.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewNotificationsRecord =
                              listViewNotificationsRecordList[listViewIndex];
                          return StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                listViewNotificationsRecord.userFrom!),
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

                              final conditionalBuilderUsersRecord =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  if (listViewNotificationsRecord.type ==
                                      'Friend request') {
                                    return wrapWithModel(
                                      model: _model
                                          .friendRequestNotificationComponentModels
                                          .getModel(
                                        conditionalBuilderUsersRecord
                                            .reference.id,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child:
                                          FriendRequestNotificationComponentWidget(
                                        key: Key(
                                          'Keyw4q_${conditionalBuilderUsersRecord.reference.id}',
                                        ),
                                        userformParamter:
                                            conditionalBuilderUsersRecord
                                                .reference,
                                        referenceFirendRequest:
                                            listViewNotificationsRecord
                                                .friendRequestId?.id,
                                        notificationParameter:
                                            listViewNotificationsRecord
                                                .reference,
                                      ),
                                    );
                                  } else if (listViewNotificationsRecord.type ==
                                      'new message') {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          ChatViewPageWidget.routeName,
                                          queryParameters: {
                                            'chatParameter': serializeParam(
                                              listViewNotificationsRecord
                                                  .chatId,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        await listViewNotificationsRecord
                                            .reference
                                            .update(
                                                createNotificationsRecordData(
                                          read: true,
                                        ));
                                      },
                                      child: wrapWithModel(
                                        model: _model
                                            .newMessageNotificationComponentModels
                                            .getModel(
                                          listViewNotificationsRecord
                                              .reference.id,
                                          listViewIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child:
                                            NewMessageNotificationComponentWidget(
                                          key: Key(
                                            'Key4j0_${listViewNotificationsRecord.reference.id}',
                                          ),
                                          userFromParameter:
                                              listViewNotificationsRecord
                                                  .userFrom,
                                          notificationParameter:
                                              listViewNotificationsRecord
                                                  .reference,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
