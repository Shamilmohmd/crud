// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAgmYu3gbyH_waujTnAHtoOgBxYqx1N_K4',
    appId: '1:1010474950271:web:5fecdad9ac73f55b2f694a',
    messagingSenderId: '1010474950271',
    projectId: 'flit-crud-1a1fc',
    authDomain: 'flit-crud-1a1fc.firebaseapp.com',
    storageBucket: 'flit-crud-1a1fc.appspot.com',
    measurementId: 'G-7JCBWM0EKG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZqSuN6PT6rg0S_yPqtWk51qJ4Za8LirE',
    appId: '1:1010474950271:android:23c51c974c4d8dc82f694a',
    messagingSenderId: '1010474950271',
    projectId: 'flit-crud-1a1fc',
    storageBucket: 'flit-crud-1a1fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkhrkAA-Y2KuUjQ4ZL-2VDeVLKINElu-Y',
    appId: '1:1010474950271:ios:5eaf16f338d52c232f694a',
    messagingSenderId: '1010474950271',
    projectId: 'flit-crud-1a1fc',
    storageBucket: 'flit-crud-1a1fc.appspot.com',
    iosBundleId: 'com.example.crud',
  );
}
