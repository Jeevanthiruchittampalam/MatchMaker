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
    apiKey: 'AIzaSyD1Hd92Tt_L0kHL3sQgmL8-A9gC5qfCv58',
    appId: '1:716590638649:web:7f780c1be36dd2ff544fe8',
    messagingSenderId: '716590638649',
    projectId: 'matchmaker-7494d',
    authDomain: 'matchmaker-7494d.firebaseapp.com',
    storageBucket: 'matchmaker-7494d.appspot.com',
    measurementId: 'G-BNRTRMXFXX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJR_4GihHmtT15cgW7bXBguMcbaImnDRI',
    appId: '1:716590638649:android:e943530e8a017efb544fe8',
    messagingSenderId: '716590638649',
    projectId: 'matchmaker-7494d',
    storageBucket: 'matchmaker-7494d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAK7AuYJnrjkvUcNZc_8V9_wab6rgam_K4',
    appId: '1:716590638649:ios:443a7704de8d6b90544fe8',
    messagingSenderId: '716590638649',
    projectId: 'matchmaker-7494d',
    storageBucket: 'matchmaker-7494d.appspot.com',
    iosBundleId: 'com.example.matchmaker',
  );
}
