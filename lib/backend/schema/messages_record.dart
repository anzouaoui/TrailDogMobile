import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// collection enregistrant les messages d'un chat
class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "activity" field.
  DocumentReference? _activity;
  DocumentReference? get activity => _activity;
  bool hasActivity() => _activity != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _activity = snapshotData['activity'] as DocumentReference?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? text,
  String? imageUrl,
  DocumentReference? activity,
  DocumentReference? sender,
  DateTime? timestamp,
  DocumentReference? chatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'imageUrl': imageUrl,
      'activity': activity,
      'sender': sender,
      'timestamp': timestamp,
      'chatRef': chatRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.activity == e2?.activity &&
        e1?.sender == e2?.sender &&
        e1?.timestamp == e2?.timestamp &&
        e1?.chatRef == e2?.chatRef;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash(
      [e?.text, e?.imageUrl, e?.activity, e?.sender, e?.timestamp, e?.chatRef]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
