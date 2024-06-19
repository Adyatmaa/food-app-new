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
    apiKey: 'AIzaSyBEaO3wgGDcMmaKnFKH_-TxKHkNNcgy3xQ',
    appId: '1:900135175865:web:bbf458b75ea52ebd2afd68',
    messagingSenderId: '900135175865',
    projectId: 'food-app-744fb',
    authDomain: 'food-app-744fb.firebaseapp.com',
    storageBucket: 'food-app-744fb.appspot.com',
    measurementId: 'G-8Y2JBM95DV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhZtvkmLt1pF1a-GO4SeNu8gamwr7_9m8',
    appId: '1:900135175865:android:9bf6d2f6a3b0ed712afd68',
    messagingSenderId: '900135175865',
    projectId: 'food-app-744fb',
    storageBucket: 'food-app-744fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7C51hLaZSV9YZSWQvswoF2sLD6QqTdss',
    appId: '1:900135175865:ios:e7ff3a99cafc6f9a2afd68',
    messagingSenderId: '900135175865',
    projectId: 'food-app-744fb',
    storageBucket: 'food-app-744fb.appspot.com',
    iosBundleId: 'com.example.foodappNew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7C51hLaZSV9YZSWQvswoF2sLD6QqTdss',
    appId: '1:900135175865:ios:e7ff3a99cafc6f9a2afd68',
    messagingSenderId: '900135175865',
    projectId: 'food-app-744fb',
    storageBucket: 'food-app-744fb.appspot.com',
    iosBundleId: 'com.example.foodappNew',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBEaO3wgGDcMmaKnFKH_-TxKHkNNcgy3xQ',
    appId: '1:900135175865:web:ccb41d40fc47be002afd68',
    messagingSenderId: '900135175865',
    projectId: 'food-app-744fb',
    authDomain: 'food-app-744fb.firebaseapp.com',
    storageBucket: 'food-app-744fb.appspot.com',
    measurementId: 'G-MWYEPMVBRN',
  );
}