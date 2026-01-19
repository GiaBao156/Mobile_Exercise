import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('Platform not supported');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAd7uGvuf6b7ct5_xdt7gQ5XkhlxP-KSec',
    authDomain: 'uth-smarttasks-f9376.firebaseapp.com',
    databaseURL: 'https://uth-smarttasks-f9376-default-rtdb.firebaseio.com',
    projectId: 'uth-smarttasks-f9376',
    storageBucket: 'uth-smarttasks-f9376.firebasestorage.app',
    messagingSenderId: '486092940652',
    appId: '1:486092940652:web:f76cf6460701fa35153f49',
    measurementId: 'G-ZYD6GC26ET',
  );

  // Lấy apiKey từ google-services.json (current_key)
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbTvmneUqj7LsrIVK_rBCGWhT_zcu5X1g',
    appId: '1:486092940652:android:244a080c834dac4f153f49',
    messagingSenderId: '486092940652',
    projectId: 'uth-smarttasks-f9376',
    storageBucket: 'uth-smarttasks-f9376.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbTvmneUqj7LsrIVK_rBCGWhT_zcu5X1g',
    appId: '1:486092940652:android:244a080c834dac4f153f49',
    messagingSenderId: '486092940652',
    projectId: 'uth-smarttasks-f9376',
    storageBucket: 'uth-smarttasks-f9376.firebasestorage.app',
    iosBundleId: 'com.example.uthSmartTasks',
  );
}
