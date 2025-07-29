import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Collections des badges
class BadgesRecord extends FirestoreRecord {
  BadgesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "condition_type" field.
  String? _conditionType;
  String get conditionType => _conditionType ?? '';
  bool hasConditionType() => _conditionType != null;

  // "condition_value" field.
  int? _conditionValue;
  int get conditionValue => _conditionValue ?? 0;
  bool hasConditionValue() => _conditionValue != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _type = snapshotData['type'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _conditionType = snapshotData['condition_type'] as String?;
    _conditionValue = castToType<int>(snapshotData['condition_value']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('badges');

  static Stream<BadgesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BadgesRecord.fromSnapshot(s));

  static Future<BadgesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BadgesRecord.fromSnapshot(s));

  static BadgesRecord fromSnapshot(DocumentSnapshot snapshot) => BadgesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BadgesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BadgesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BadgesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BadgesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBadgesRecordData({
  String? id,
  String? type,
  String? title,
  String? description,
  String? conditionType,
  int? conditionValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'type': type,
      'title': title,
      'description': description,
      'condition_type': conditionType,
      'condition_value': conditionValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class BadgesRecordDocumentEquality implements Equality<BadgesRecord> {
  const BadgesRecordDocumentEquality();

  @override
  bool equals(BadgesRecord? e1, BadgesRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.type == e2?.type &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.conditionType == e2?.conditionType &&
        e1?.conditionValue == e2?.conditionValue;
  }

  @override
  int hash(BadgesRecord? e) => const ListEquality().hash([
        e?.id,
        e?.type,
        e?.title,
        e?.description,
        e?.conditionType,
        e?.conditionValue
      ]);

  @override
  bool isValidKey(Object? o) => o is BadgesRecord;
}
