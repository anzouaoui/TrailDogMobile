import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// users collection
class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  bool hasFirstname() => _firstname != null;

  // "lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  bool hasLastname() => _lastname != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "main_activity" field.
  String? _mainActivity;
  String get mainActivity => _mainActivity ?? '';
  bool hasMainActivity() => _mainActivity != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "heart_care" field.
  int? _heartCare;
  int get heartCare => _heartCare ?? 0;
  bool hasHeartCare() => _heartCare != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  bool hasBirthdate() => _birthdate != null;

  // "total_ditance" field.
  double? _totalDitance;
  double get totalDitance => _totalDitance ?? 0.0;
  bool hasTotalDitance() => _totalDitance != null;

  // "total_hours" field.
  int? _totalHours;
  int get totalHours => _totalHours ?? 0;
  bool hasTotalHours() => _totalHours != null;

  // "badges_count" field.
  int? _badgesCount;
  int get badgesCount => _badgesCount ?? 0;
  bool hasBadgesCount() => _badgesCount != null;

  // "total_activities" field.
  int? _totalActivities;
  int get totalActivities => _totalActivities ?? 0;
  bool hasTotalActivities() => _totalActivities != null;

  // "is_premium" field.
  bool? _isPremium;
  bool get isPremium => _isPremium ?? false;
  bool hasIsPremium() => _isPremium != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstname = snapshotData['firstname'] as String?;
    _lastname = snapshotData['lastname'] as String?;
    _city = snapshotData['city'] as String?;
    _mainActivity = snapshotData['main_activity'] as String?;
    _bio = snapshotData['bio'] as String?;
    _gender = snapshotData['gender'] as String?;
    _weight = castToType<int>(snapshotData['weight']);
    _heartCare = castToType<int>(snapshotData['heart_care']);
    _age = castToType<int>(snapshotData['age']);
    _birthdate = snapshotData['birthdate'] as DateTime?;
    _totalDitance = castToType<double>(snapshotData['total_ditance']);
    _totalHours = castToType<int>(snapshotData['total_hours']);
    _badgesCount = castToType<int>(snapshotData['badges_count']);
    _totalActivities = castToType<int>(snapshotData['total_activities']);
    _isPremium = snapshotData['is_premium'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'firstname': snapshot.data['firstname'],
          'lastname': snapshot.data['lastname'],
          'city': snapshot.data['city'],
          'main_activity': snapshot.data['main_activity'],
          'bio': snapshot.data['bio'],
          'gender': snapshot.data['gender'],
          'weight': convertAlgoliaParam(
            snapshot.data['weight'],
            ParamType.int,
            false,
          ),
          'heart_care': convertAlgoliaParam(
            snapshot.data['heart_care'],
            ParamType.int,
            false,
          ),
          'age': convertAlgoliaParam(
            snapshot.data['age'],
            ParamType.int,
            false,
          ),
          'birthdate': convertAlgoliaParam(
            snapshot.data['birthdate'],
            ParamType.DateTime,
            false,
          ),
          'total_ditance': convertAlgoliaParam(
            snapshot.data['total_ditance'],
            ParamType.double,
            false,
          ),
          'total_hours': convertAlgoliaParam(
            snapshot.data['total_hours'],
            ParamType.int,
            false,
          ),
          'badges_count': convertAlgoliaParam(
            snapshot.data['badges_count'],
            ParamType.int,
            false,
          ),
          'total_activities': convertAlgoliaParam(
            snapshot.data['total_activities'],
            ParamType.int,
            false,
          ),
          'is_premium': snapshot.data['is_premium'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstname,
  String? lastname,
  String? city,
  String? mainActivity,
  String? bio,
  String? gender,
  int? weight,
  int? heartCare,
  int? age,
  DateTime? birthdate,
  double? totalDitance,
  int? totalHours,
  int? badgesCount,
  int? totalActivities,
  bool? isPremium,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'firstname': firstname,
      'lastname': lastname,
      'city': city,
      'main_activity': mainActivity,
      'bio': bio,
      'gender': gender,
      'weight': weight,
      'heart_care': heartCare,
      'age': age,
      'birthdate': birthdate,
      'total_ditance': totalDitance,
      'total_hours': totalHours,
      'badges_count': badgesCount,
      'total_activities': totalActivities,
      'is_premium': isPremium,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.firstname == e2?.firstname &&
        e1?.lastname == e2?.lastname &&
        e1?.city == e2?.city &&
        e1?.mainActivity == e2?.mainActivity &&
        e1?.bio == e2?.bio &&
        e1?.gender == e2?.gender &&
        e1?.weight == e2?.weight &&
        e1?.heartCare == e2?.heartCare &&
        e1?.age == e2?.age &&
        e1?.birthdate == e2?.birthdate &&
        e1?.totalDitance == e2?.totalDitance &&
        e1?.totalHours == e2?.totalHours &&
        e1?.badgesCount == e2?.badgesCount &&
        e1?.totalActivities == e2?.totalActivities &&
        e1?.isPremium == e2?.isPremium;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.firstname,
        e?.lastname,
        e?.city,
        e?.mainActivity,
        e?.bio,
        e?.gender,
        e?.weight,
        e?.heartCare,
        e?.age,
        e?.birthdate,
        e?.totalDitance,
        e?.totalHours,
        e?.badgesCount,
        e?.totalActivities,
        e?.isPremium
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
