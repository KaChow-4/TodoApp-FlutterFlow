import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCfOZeP3qlSxrUbPH01nk791QZRSDA0fVA",
            authDomain: "todo-1xhj57.firebaseapp.com",
            projectId: "todo-1xhj57",
            storageBucket: "todo-1xhj57.firebasestorage.app",
            messagingSenderId: "1005489509359",
            appId: "1:1005489509359:web:6997118adc3c2223991c1a",
            measurementId: "G-Y4KTMET9Z3"));
  } else {
    await Firebase.initializeApp();
  }
}
