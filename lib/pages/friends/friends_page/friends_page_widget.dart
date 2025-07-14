import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/friends/friend_request_component/friend_request_component_widget.dart';
import '/component/friends/friends_compoennt/friends_compoennt_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'friends_page_model.dart';
export 'friends_page_model.dart';

/// Page de liste d’amis pour une application sportive.
///
/// - Affichage des amis de l’utilisateur actuel.
/// - Pour chaque ami : afficher son nom, son @pseudo et sa photo de profil.
/// - Bouton “Envoyer un message” à côté de chaque ami (icône ou texte).
/// - Barre de recherche en haut pour filtrer les amis par nom ou pseudo.
/// - Affichage sous forme de ListView moderne avec des cards ou containers
/// légers.
/// - Bouton retour vers la page principale (icône flèche en haut à gauche).
/// - Design cohérent avec le reste de l’application : sobre, moderne, boutons
/// arrondis.
/// - Espacements suffisants pour une bonne lisibilité mobile.
/// - Icône ou badge indiquant le nombre total d’amis en haut de page
/// (optionnel).
class FriendsPageWidget extends StatefulWidget {
  const FriendsPageWidget({super.key});

  static String routeName = 'FriendsPage';
  static String routePath = '/friendsPage';

  @override
  State<FriendsPageWidget> createState() => _FriendsPageWidgetState();
}

class _FriendsPageWidgetState extends State<FriendsPageWidget> {
  late FriendsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendsPageModel());
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
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
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
                          'r5p9kb47' /* My friends */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: StreamBuilder<List<FriendsRecord>>(
                        stream: queryFriendsRecord(
                          parent: currentUserReference,
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
                          List<FriendsRecord> columnFriendsRecordList =
                              snapshot.data!;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnFriendsRecordList.length, (columnIndex) {
                              final columnFriendsRecord =
                                  columnFriendsRecordList[columnIndex];
                              return StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    columnFriendsRecord.friendRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final friendsCompoenntUsersRecord =
                                      snapshot.data!;

                                  return wrapWithModel(
                                    model:
                                        _model.friendsCompoenntModels.getModel(
                                      friendsCompoenntUsersRecord.uid,
                                      columnIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: FriendsCompoenntWidget(
                                      key: Key(
                                        'Key5mv_${friendsCompoenntUsersRecord.uid}',
                                      ),
                                      userParameter:
                                          friendsCompoenntUsersRecord.reference,
                                    ),
                                  );
                                },
                              );
                            }).divide(SizedBox(height: 8.0)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'de9trdrj' /* Requests sent */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: StreamBuilder<List<FriendsRequestsRecord>>(
                          stream: queryFriendsRequestsRecord(
                            queryBuilder: (friendsRequestsRecord) =>
                                friendsRequestsRecord
                                    .where(
                                      'user_from',
                                      isEqualTo: currentUserReference,
                                    )
                                    .where(
                                      'status',
                                      isEqualTo: 'Pending',
                                    )
                                    .orderBy('created_at'),
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
                            List<FriendsRequestsRecord>
                                columnFriendsRequestsRecordList =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnFriendsRequestsRecordList.length,
                                  (columnIndex) {
                                final columnFriendsRequestsRecord =
                                    columnFriendsRequestsRecordList[
                                        columnIndex];
                                return wrapWithModel(
                                  model: _model.friendRequestComponentModels
                                      .getModel(
                                    columnFriendsRequestsRecord.userFrom!.id,
                                    columnIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: FriendRequestComponentWidget(
                                    key: Key(
                                      'Key79d_${columnFriendsRequestsRecord.userFrom!.id}',
                                    ),
                                    friendRequestParameter:
                                        columnFriendsRequestsRecord.reference,
                                  ),
                                );
                              }).divide(SizedBox(height: 12.0)),
                            );
                          },
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(AskFriendPageWidget.routeName);
                      },
                      text: FFLocalizations.of(context).getText(
                        'ek5919r9' /* Research new friends */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 16.0))
                  .addToStart(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
