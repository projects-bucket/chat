import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        appId: '1:448618578101:web:0b650370bb29e29cac3efc',
        apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:448618578101:ios:0b650370bb29e29cac3efc',
        apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
        iosBundleId: 'io.flutter.plugins.firebasecoreexample',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:958062117792:android:644455a55d8871fcf65ac5',
        apiKey: 'AIzaSyDeg31CmydKBt8PAtiB4tGvBYviCTBWB0I',
        projectId: 'chub-64c91',
        messagingSenderId: '958062117792',
        storageBucket: "chub-64c91.appspot.com"
      );
    }
  }
}