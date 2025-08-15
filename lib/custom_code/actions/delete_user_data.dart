// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteUserData(String uid) async {
  final firestore = FirebaseFirestore.instance;

  // Sous-collections de l'utilisateur
  final subCollections = ['dog', 'activity', 'friends'];
  for (final subCol in subCollections) {
    final snapshot =
        await firestore.collection('users').doc(uid).collection(subCol).get();
    for (final doc in snapshot.docs) {
      await firestore
          .collection('users')
          .doc(uid)
          .collection(subCol)
          .doc(doc.id)
          .delete();
    }
  }
  // Document utilisateur
  await firestore.collection('users').doc(uid).delete();

  // Suppression des posts de l'utilisateur
  final postsSnap = await firestore
      .collection('posts')
      .where('user_id', isEqualTo: uid)
      .get();
  for (final doc in postsSnap.docs) {
    await firestore.collection('posts').doc(doc.id).delete();
  }

  // Suppression des messages (exemple si tu stockes un champ user_id)
  final messagesSnap = await firestore
      .collection('messages')
      .where('user_id', isEqualTo: uid)
      .get();
  for (final doc in messagesSnap.docs) {
    await firestore.collection('messages').doc(doc.id).delete();
  }

  // Suppression des commentaires (exemple)
  final commentsSnap = await firestore
      .collection('comments')
      .where('user_id', isEqualTo: uid)
      .get();
  for (final doc in commentsSnap.docs) {
    await firestore.collection('comments').doc(doc.id).delete();
  }

  // Idem pour toutes autres collections où l'utilisateur a créé un document...
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
