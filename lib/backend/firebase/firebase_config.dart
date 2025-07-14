import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBx2FdXW7XfKZuLLTQA4_qbl-_muswG6GE",
            authDomain: "traildog-1e3c9.firebaseapp.com",
            projectId: "traildog-1e3c9",
            storageBucket: "traildog-1e3c9.firebasestorage.app",
            messagingSenderId: "155891952495",
            appId: "1:155891952495:web:f4b93c0aed4a3a5efe169a"));
  } else {
    await Firebase.initializeApp();
  }
}
