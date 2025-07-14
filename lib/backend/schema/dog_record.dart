import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// dog table
class DogRecord extends FirestoreRecord {
  DogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "breed" field.
  String? _breed;
  String get breed => _breed ?? '';
  bool hasBreed() => _breed != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "size" field.
  int? _size;
  int get size => _size ?? 0;
  bool hasSize() => _size != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "heart_care" field.
  int? _heartCare;
  int get heartCare => _heartCare ?? 0;
  bool hasHeartCare() => _heartCare != null;

  // "palmares" field.
  String? _palmares;
  String get palmares => _palmares ?? '';
  bool hasPalmares() => _palmares != null;

  // "health" field.
  String? _health;
  String get health => _health ?? '';
  bool hasHealth() => _health != null;

  // "puce" field.
  String? _puce;
  String get puce => _puce ?? '';
  bool hasPuce() => _puce != null;

  // "main_activity" field.
  String? _mainActivity;
  String get mainActivity => _mainActivity ?? '';
  bool hasMainActivity() => _mainActivity != null;

  // "experience" field.
  String? _experience;
  String get experience => _experience ?? '';
  bool hasExperience() => _experience != null;

  // "health_information" field.
  String? _healthInformation;
  String get healthInformation => _healthInformation ?? '';
  bool hasHealthInformation() => _healthInformation != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "chip" field.
  String? _chip;
  String get chip => _chip ?? '';
  bool hasChip() => _chip != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "activities_count" field.
  int? _activitiesCount;
  int get activitiesCount => _activitiesCount ?? 0;
  bool hasActivitiesCount() => _activitiesCount != null;

  // "total_distance" field.
  int? _totalDistance;
  int get totalDistance => _totalDistance ?? 0;
  bool hasTotalDistance() => _totalDistance != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "badges_count" field.
  int? _badgesCount;
  int get badgesCount => _badgesCount ?? 0;
  bool hasBadgesCount() => _badgesCount != null;

  // "average_pace" field.
  String? _averagePace;
  String get averagePace => _averagePace ?? '';
  bool hasAveragePace() => _averagePace != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _breed = snapshotData['breed'] as String?;
    _gender = snapshotData['gender'] as String?;
    _size = castToType<int>(snapshotData['size']);
    _weight = castToType<int>(snapshotData['weight']);
    _heartCare = castToType<int>(snapshotData['heart_care']);
    _palmares = snapshotData['palmares'] as String?;
    _health = snapshotData['health'] as String?;
    _puce = snapshotData['puce'] as String?;
    _mainActivity = snapshotData['main_activity'] as String?;
    _experience = snapshotData['experience'] as String?;
    _healthInformation = snapshotData['health_information'] as String?;
    _imagePath = snapshotData['image_path'] as String?;
    _chip = snapshotData['chip'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _activitiesCount = castToType<int>(snapshotData['activities_count']);
    _totalDistance = castToType<int>(snapshotData['total_distance']);
    _uid = snapshotData['uid'] as String?;
    _badgesCount = castToType<int>(snapshotData['badges_count']);
    _averagePace = snapshotData['average_pace'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dog')
          : FirebaseFirestore.instance.collectionGroup('dog');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dog').doc(id);

  static Stream<DogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DogRecord.fromSnapshot(s));

  static Future<DogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DogRecord.fromSnapshot(s));

  static DogRecord fromSnapshot(DocumentSnapshot snapshot) => DogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDogRecordData({
  String? name,
  String? breed,
  String? gender,
  int? size,
  int? weight,
  int? heartCare,
  String? palmares,
  String? health,
  String? puce,
  String? mainActivity,
  String? experience,
  String? healthInformation,
  String? imagePath,
  String? chip,
  int? age,
  int? activitiesCount,
  int? totalDistance,
  String? uid,
  int? badgesCount,
  String? averagePace,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'breed': breed,
      'gender': gender,
      'size': size,
      'weight': weight,
      'heart_care': heartCare,
      'palmares': palmares,
      'health': health,
      'puce': puce,
      'main_activity': mainActivity,
      'experience': experience,
      'health_information': healthInformation,
      'image_path': imagePath,
      'chip': chip,
      'age': age,
      'activities_count': activitiesCount,
      'total_distance': totalDistance,
      'uid': uid,
      'badges_count': badgesCount,
      'average_pace': averagePace,
    }.withoutNulls,
  );

  return firestoreData;
}

class DogRecordDocumentEquality implements Equality<DogRecord> {
  const DogRecordDocumentEquality();

  @override
  bool equals(DogRecord? e1, DogRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.breed == e2?.breed &&
        e1?.gender == e2?.gender &&
        e1?.size == e2?.size &&
        e1?.weight == e2?.weight &&
        e1?.heartCare == e2?.heartCare &&
        e1?.palmares == e2?.palmares &&
        e1?.health == e2?.health &&
        e1?.puce == e2?.puce &&
        e1?.mainActivity == e2?.mainActivity &&
        e1?.experience == e2?.experience &&
        e1?.healthInformation == e2?.healthInformation &&
        e1?.imagePath == e2?.imagePath &&
        e1?.chip == e2?.chip &&
        e1?.age == e2?.age &&
        e1?.activitiesCount == e2?.activitiesCount &&
        e1?.totalDistance == e2?.totalDistance &&
        e1?.uid == e2?.uid &&
        e1?.badgesCount == e2?.badgesCount &&
        e1?.averagePace == e2?.averagePace;
  }

  @override
  int hash(DogRecord? e) => const ListEquality().hash([
        e?.name,
        e?.breed,
        e?.gender,
        e?.size,
        e?.weight,
        e?.heartCare,
        e?.palmares,
        e?.health,
        e?.puce,
        e?.mainActivity,
        e?.experience,
        e?.healthInformation,
        e?.imagePath,
        e?.chip,
        e?.age,
        e?.activitiesCount,
        e?.totalDistance,
        e?.uid,
        e?.badgesCount,
        e?.averagePace
      ]);

  @override
  bool isValidKey(Object? o) => o is DogRecord;
}
