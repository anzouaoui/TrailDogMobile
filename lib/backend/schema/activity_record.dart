import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityRecord extends FirestoreRecord {
  ActivityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "activity_type" field.
  String? _activityType;
  String get activityType => _activityType ?? '';
  bool hasActivityType() => _activityType != null;

  // "dogs" field.
  List<DocumentReference>? _dogs;
  List<DocumentReference> get dogs => _dogs ?? const [];
  bool hasDogs() => _dogs != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  // "vitesse" field.
  double? _vitesse;
  double get vitesse => _vitesse ?? 0.0;
  bool hasVitesse() => _vitesse != null;

  // "heartbeat" field.
  int? _heartbeat;
  int get heartbeat => _heartbeat ?? 0;
  bool hasHeartbeat() => _heartbeat != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "partners" field.
  DocumentReference? _partners;
  DocumentReference? get partners => _partners;
  bool hasPartners() => _partners != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "path" field.
  List<LatLng>? _path;
  List<LatLng> get path => _path ?? const [];
  bool hasPath() => _path != null;

  // "elevation_gain" field.
  double? _elevationGain;
  double get elevationGain => _elevationGain ?? 0.0;
  bool hasElevationGain() => _elevationGain != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "activity_name" field.
  String? _activityName;
  String get activityName => _activityName ?? '';
  bool hasActivityName() => _activityName != null;

  // "duration_sec" field.
  String? _durationSec;
  String get durationSec => _durationSec ?? '';
  bool hasDurationSec() => _durationSec != null;

  // "step" field.
  int? _step;
  int get step => _step ?? 0;
  bool hasStep() => _step != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _activityType = snapshotData['activity_type'] as String?;
    _dogs = getDataList(snapshotData['dogs']);
    _distance = castToType<double>(snapshotData['distance']);
    _vitesse = castToType<double>(snapshotData['vitesse']);
    _heartbeat = castToType<int>(snapshotData['heartbeat']);
    _calories = castToType<int>(snapshotData['calories']);
    _partners = snapshotData['partners'] as DocumentReference?;
    _startTime = snapshotData['start_time'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _path = getDataList(snapshotData['path']);
    _elevationGain = castToType<double>(snapshotData['elevation_gain']);
    _note = snapshotData['note'] as String?;
    _rate = castToType<double>(snapshotData['rate']);
    _status = snapshotData['status'] as String?;
    _activityName = snapshotData['activity_name'] as String?;
    _durationSec = snapshotData['duration_sec'] as String?;
    _step = castToType<int>(snapshotData['step']);
    _comment = snapshotData['comment'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _city = snapshotData['city'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('activity')
          : FirebaseFirestore.instance.collectionGroup('activity');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('activity').doc(id);

  static Stream<ActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityRecord.fromSnapshot(s));

  static Future<ActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityRecord.fromSnapshot(s));

  static ActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityRecordData({
  String? activityType,
  double? distance,
  double? vitesse,
  int? heartbeat,
  int? calories,
  DocumentReference? partners,
  DateTime? startTime,
  DateTime? endTime,
  double? elevationGain,
  String? note,
  double? rate,
  String? status,
  String? activityName,
  String? durationSec,
  int? step,
  String? comment,
  int? rating,
  String? city,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activity_type': activityType,
      'distance': distance,
      'vitesse': vitesse,
      'heartbeat': heartbeat,
      'calories': calories,
      'partners': partners,
      'start_time': startTime,
      'end_time': endTime,
      'elevation_gain': elevationGain,
      'note': note,
      'rate': rate,
      'status': status,
      'activity_name': activityName,
      'duration_sec': durationSec,
      'step': step,
      'comment': comment,
      'rating': rating,
      'city': city,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityRecordDocumentEquality implements Equality<ActivityRecord> {
  const ActivityRecordDocumentEquality();

  @override
  bool equals(ActivityRecord? e1, ActivityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.activityType == e2?.activityType &&
        listEquality.equals(e1?.dogs, e2?.dogs) &&
        e1?.distance == e2?.distance &&
        e1?.vitesse == e2?.vitesse &&
        e1?.heartbeat == e2?.heartbeat &&
        e1?.calories == e2?.calories &&
        e1?.partners == e2?.partners &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        listEquality.equals(e1?.path, e2?.path) &&
        e1?.elevationGain == e2?.elevationGain &&
        e1?.note == e2?.note &&
        e1?.rate == e2?.rate &&
        e1?.status == e2?.status &&
        e1?.activityName == e2?.activityName &&
        e1?.durationSec == e2?.durationSec &&
        e1?.step == e2?.step &&
        e1?.comment == e2?.comment &&
        e1?.rating == e2?.rating &&
        e1?.city == e2?.city;
  }

  @override
  int hash(ActivityRecord? e) => const ListEquality().hash([
        e?.activityType,
        e?.dogs,
        e?.distance,
        e?.vitesse,
        e?.heartbeat,
        e?.calories,
        e?.partners,
        e?.startTime,
        e?.endTime,
        e?.path,
        e?.elevationGain,
        e?.note,
        e?.rate,
        e?.status,
        e?.activityName,
        e?.durationSec,
        e?.step,
        e?.comment,
        e?.rating,
        e?.city
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivityRecord;
}
