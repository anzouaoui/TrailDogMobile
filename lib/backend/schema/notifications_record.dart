import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// tables des notifications
class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "user_to" field.
  DocumentReference? _userTo;
  DocumentReference? get userTo => _userTo;
  bool hasUserTo() => _userTo != null;

  // "user_from" field.
  DocumentReference? _userFrom;
  DocumentReference? get userFrom => _userFrom;
  bool hasUserFrom() => _userFrom != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "friendRequest_id" field.
  DocumentReference? _friendRequestId;
  DocumentReference? get friendRequestId => _friendRequestId;
  bool hasFriendRequestId() => _friendRequestId != null;

  // "chat_id" field.
  DocumentReference? _chatId;
  DocumentReference? get chatId => _chatId;
  bool hasChatId() => _chatId != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _userTo = snapshotData['user_to'] as DocumentReference?;
    _userFrom = snapshotData['user_from'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _read = snapshotData['read'] as bool?;
    _content = snapshotData['content'] as String?;
    _friendRequestId = snapshotData['friendRequest_id'] as DocumentReference?;
    _chatId = snapshotData['chat_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? type,
  DocumentReference? userTo,
  DocumentReference? userFrom,
  DateTime? createdAt,
  bool? read,
  String? content,
  DocumentReference? friendRequestId,
  DocumentReference? chatId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'user_to': userTo,
      'user_from': userFrom,
      'created_at': createdAt,
      'read': read,
      'content': content,
      'friendRequest_id': friendRequestId,
      'chat_id': chatId,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.userTo == e2?.userTo &&
        e1?.userFrom == e2?.userFrom &&
        e1?.createdAt == e2?.createdAt &&
        e1?.read == e2?.read &&
        e1?.content == e2?.content &&
        e1?.friendRequestId == e2?.friendRequestId &&
        e1?.chatId == e2?.chatId;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.userTo,
        e?.userFrom,
        e?.createdAt,
        e?.read,
        e?.content,
        e?.friendRequestId,
        e?.chatId
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
