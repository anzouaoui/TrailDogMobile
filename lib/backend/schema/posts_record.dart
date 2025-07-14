import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// postes publiées dans la file d'actualité
class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "picture_url" field.
  String? _pictureUrl;
  String get pictureUrl => _pictureUrl ?? '';
  bool hasPictureUrl() => _pictureUrl != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "media_type" field.
  String? _mediaType;
  String get mediaType => _mediaType ?? '';
  bool hasMediaType() => _mediaType != null;

  // "location_name" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "activity_type" field.
  String? _activityType;
  String get activityType => _activityType ?? '';
  bool hasActivityType() => _activityType != null;

  // "likes_count" field.
  int? _likesCount;
  int get likesCount => _likesCount ?? 0;
  bool hasLikesCount() => _likesCount != null;

  // "comments_count" field.
  int? _commentsCount;
  int get commentsCount => _commentsCount ?? 0;
  bool hasCommentsCount() => _commentsCount != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _text = snapshotData['text'] as String?;
    _pictureUrl = snapshotData['picture_url'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
    _mediaType = snapshotData['media_type'] as String?;
    _locationName = snapshotData['location_name'] as String?;
    _activityType = snapshotData['activity_type'] as String?;
    _likesCount = castToType<int>(snapshotData['likes_count']);
    _commentsCount = castToType<int>(snapshotData['comments_count']);
    _likedBy = getDataList(snapshotData['liked_by']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  DocumentReference? userRef,
  DateTime? timestamp,
  String? text,
  String? pictureUrl,
  String? videoUrl,
  String? mediaType,
  String? locationName,
  String? activityType,
  int? likesCount,
  int? commentsCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'timestamp': timestamp,
      'text': text,
      'picture_url': pictureUrl,
      'video_url': videoUrl,
      'media_type': mediaType,
      'location_name': locationName,
      'activity_type': activityType,
      'likes_count': likesCount,
      'comments_count': commentsCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.text == e2?.text &&
        e1?.pictureUrl == e2?.pictureUrl &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.mediaType == e2?.mediaType &&
        e1?.locationName == e2?.locationName &&
        e1?.activityType == e2?.activityType &&
        e1?.likesCount == e2?.likesCount &&
        e1?.commentsCount == e2?.commentsCount &&
        listEquality.equals(e1?.likedBy, e2?.likedBy);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.timestamp,
        e?.text,
        e?.pictureUrl,
        e?.videoUrl,
        e?.mediaType,
        e?.locationName,
        e?.activityType,
        e?.likesCount,
        e?.commentsCount,
        e?.likedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
