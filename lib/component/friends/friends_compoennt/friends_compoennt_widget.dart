import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'friends_compoennt_model.dart';
export 'friends_compoennt_model.dart';

/// Composant pour affche run amid asn ma liste d'amis
class FriendsCompoenntWidget extends StatefulWidget {
  const FriendsCompoenntWidget({
    super.key,
    required this.userParameter,
  });

  /// pramètre de l'utilisateur ami
  final DocumentReference? userParameter;

  @override
  State<FriendsCompoenntWidget> createState() => _FriendsCompoenntWidgetState();
}

class _FriendsCompoenntWidgetState extends State<FriendsCompoenntWidget> {
  late FriendsCompoenntModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendsCompoenntModel());
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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder<UsersRecord>(
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

            final columnUsersRecord = snapshot.data!;

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            'https://images.unsplash.com/photo-1542206395-9feb3edaa68d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NTEyOTEzMjJ8&ixlib=rb-4.1.0&q=80&w=1080',
                          ).image,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${columnUsersRecord.firstname} ${columnUsersRecord.lastname}',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.message_rounded,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        var chatRecordReference = ChatRecord.collection.doc();
                        await chatRecordReference.set({
                          ...createChatRecordData(
                            lastMessage: '',
                            lastMessageTime: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'users': [currentUserReference],
                            },
                          ),
                        });
                        _model.chatoutput = ChatRecord.getDocumentFromData({
                          ...createChatRecordData(
                            lastMessage: '',
                            lastMessageTime: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'users': [currentUserReference],
                            },
                          ),
                        }, chatRecordReference);

                        await _model.chatoutput!.reference.update({
                          ...mapToFirestore(
                            {
                              'users': FieldValue.arrayUnion(
                                  [columnUsersRecord.reference]),
                            },
                          ),
                        });
                        FFAppState().haveMessage = true;

                        context.pushNamed(
                          ChatViewPageWidget.routeName,
                          queryParameters: {
                            'chatParameter': serializeParam(
                              _model.chatoutput?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        safeSetState(() {});
                      },
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
