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
        return macos;
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
    apiKey: 'AIzaSyBUZp5xb0pEkN5iYf2xAfi4JYdjM64ylSE',
    appId: '1:12648168338:web:cb9e5db35470ccb2fc5f4b',
    messagingSenderId: '12648168338',
    projectId: 'maps-marker-db',
    authDomain: 'maps-marker-db.firebaseapp.com',
    storageBucket: 'maps-marker-db.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYCzI_tUMp8o8RsSEQYam1oRLdTzzhGyA',
    appId: '1:12648168338:android:ff2047fb07658e6ffc5f4b',
    messagingSenderId: '12648168338',
    projectId: 'maps-marker-db',
    storageBucket: 'maps-marker-db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtsVHrlPhSPcQGUwvbWNSEDPo__Jt0LvA',
    appId: '1:12648168338:ios:c533fbaceca6241afc5f4b',
    messagingSenderId: '12648168338',
    projectId: 'maps-marker-db',
    storageBucket: 'maps-marker-db.appspot.com',
    iosBundleId: 'com.example.mapsMarker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtsVHrlPhSPcQGUwvbWNSEDPo__Jt0LvA',
    appId: '1:12648168338:ios:49f4a4153043fc43fc5f4b',
    messagingSenderId: '12648168338',
    projectId: 'maps-marker-db',
    storageBucket: 'maps-marker-db.appspot.com',
    iosBundleId: 'com.example.mapsMarker.RunnerTests',
  );
}
