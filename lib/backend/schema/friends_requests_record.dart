import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// savoir qui est ami avec qui, pour afficher le fil d’actualité, limiter les
/// actions
class FriendsRequestsRecord extends FirestoreRecord {
  FriendsRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_from" field.
  DocumentReference? _userFrom;
  DocumentReference? get userFrom => _userFrom;
  bool hasUserFrom() => _userFrom != null;

  // "user_to" field.
  DocumentReference? _userTo;
  DocumentReference? get userTo => _userTo;
  bool hasUserTo() => _userTo != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _userFrom = snapshotData['user_from'] as DocumentReference?;
    _userTo = snapshotData['user_to'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friendsRequests');

  static Stream<FriendsRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendsRequestsRecord.fromSnapshot(s));

  static Future<FriendsRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendsRequestsRecord.fromSnapshot(s));

  static FriendsRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendsRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendsRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendsRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendsRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendsRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendsRequestsRecordData({
  DocumentReference? userFrom,
  DocumentReference? userTo,
  String? status,
  DateTime? createdAt,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_from': userFrom,
      'user_to': userTo,
      'status': status,
      'created_at': createdAt,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendsRequestsRecordDocumentEquality
    implements Equality<FriendsRequestsRecord> {
  const FriendsRequestsRecordDocumentEquality();

  @override
  bool equals(FriendsRequestsRecord? e1, FriendsRequestsRecord? e2) {
    return e1?.userFrom == e2?.userFrom &&
        e1?.userTo == e2?.userTo &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(FriendsRequestsRecord? e) => const ListEquality()
      .hash([e?.userFrom, e?.userTo, e?.status, e?.createdAt, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is FriendsRequestsRecord;
}
