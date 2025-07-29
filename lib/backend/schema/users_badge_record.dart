import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Badges gagnés par utilisateur
class UsersBadgeRecord extends FirestoreRecord {
  UsersBadgeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "badge_id" field.
  DocumentReference? _badgeId;
  DocumentReference? get badgeId => _badgeId;
  bool hasBadgeId() => _badgeId != null;

  // "earned_at" field.
  DateTime? _earnedAt;
  DateTime? get earnedAt => _earnedAt;
  bool hasEarnedAt() => _earnedAt != null;

  // "activity_id" field.
  DocumentReference? _activityId;
  DocumentReference? get activityId => _activityId;
  bool hasActivityId() => _activityId != null;

  // "dog_id" field.
  DocumentReference? _dogId;
  DocumentReference? get dogId => _dogId;
  bool hasDogId() => _dogId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _badgeId = snapshotData['badge_id'] as DocumentReference?;
    _earnedAt = snapshotData['earned_at'] as DateTime?;
    _activityId = snapshotData['activity_id'] as DocumentReference?;
    _dogId = snapshotData['dog_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_badge');

  static Stream<UsersBadgeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersBadgeRecord.fromSnapshot(s));

  static Future<UsersBadgeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersBadgeRecord.fromSnapshot(s));

  static UsersBadgeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersBadgeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersBadgeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersBadgeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersBadgeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersBadgeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersBadgeRecordData({
  DocumentReference? userId,
  DocumentReference? badgeId,
  DateTime? earnedAt,
  DocumentReference? activityId,
  DocumentReference? dogId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'badge_id': badgeId,
      'earned_at': earnedAt,
      'activity_id': activityId,
      'dog_id': dogId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersBadgeRecordDocumentEquality implements Equality<UsersBadgeRecord> {
  const UsersBadgeRecordDocumentEquality();

  @override
  bool equals(UsersBadgeRecord? e1, UsersBadgeRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.badgeId == e2?.badgeId &&
        e1?.earnedAt == e2?.earnedAt &&
        e1?.activityId == e2?.activityId &&
        e1?.dogId == e2?.dogId;
  }

  @override
  int hash(UsersBadgeRecord? e) => const ListEquality()
      .hash([e?.userId, e?.badgeId, e?.earnedAt, e?.activityId, e?.dogId]);

  @override
  bool isValidKey(Object? o) => o is UsersBadgeRecord;
}
