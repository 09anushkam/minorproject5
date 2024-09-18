// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCJ7Tv-CpRxXeKkx2MuYSfB7xxpUq9XoaM',
    appId: '1:629625107390:web:26905fa39372159d5b3fef',
    messagingSenderId: '629625107390',
    projectId: 'minor-eb3de',
    authDomain: 'minor-eb3de.firebaseapp.com',
    databaseURL: 'https://minor-eb3de-default-rtdb.firebaseio.com',
    storageBucket: 'minor-eb3de.appspot.com',
    measurementId: 'G-CLDG3XHH08',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqK4Lq7OUKi8vyhvYGQR9am1xXv6WYZYg',
    appId: '1:629625107390:android:885a1b8d3ec5d7e25b3fef',
    messagingSenderId: '629625107390',
    projectId: 'minor-eb3de',
    databaseURL: 'https://minor-eb3de-default-rtdb.firebaseio.com',
    storageBucket: 'minor-eb3de.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBs5-i1FZIyNFgcsLz0_qdTzxz0tEKA9lI',
    appId: '1:629625107390:ios:dfe9ab26c9d13f555b3fef',
    messagingSenderId: '629625107390',
    projectId: 'minor-eb3de',
    databaseURL: 'https://minor-eb3de-default-rtdb.firebaseio.com',
    storageBucket: 'minor-eb3de.appspot.com',
    iosBundleId: 'com.example.groceryShopAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBs5-i1FZIyNFgcsLz0_qdTzxz0tEKA9lI',
    appId: '1:629625107390:ios:dfe9ab26c9d13f555b3fef',
    messagingSenderId: '629625107390',
    projectId: 'minor-eb3de',
    databaseURL: 'https://minor-eb3de-default-rtdb.firebaseio.com',
    storageBucket: 'minor-eb3de.appspot.com',
    iosBundleId: 'com.example.groceryShopAdmin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCJ7Tv-CpRxXeKkx2MuYSfB7xxpUq9XoaM',
    appId: '1:629625107390:web:2d17686c1d302eb05b3fef',
    messagingSenderId: '629625107390',
    projectId: 'minor-eb3de',
    authDomain: 'minor-eb3de.firebaseapp.com',
    databaseURL: 'https://minor-eb3de-default-rtdb.firebaseio.com',
    storageBucket: 'minor-eb3de.appspot.com',
    measurementId: 'G-K3HFSFD5B5',
  );
}
