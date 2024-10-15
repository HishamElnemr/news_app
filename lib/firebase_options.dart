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
    apiKey: 'AIzaSyCRry66ksS-EqDkAu9hZQb1B1dMNSSHdYA',
    appId: '1:740690763276:web:50de5de3fa1fbd45845829',
    messagingSenderId: '740690763276',
    projectId: 'news-app-5539d',
    authDomain: 'news-app-5539d.firebaseapp.com',
    storageBucket: 'news-app-5539d.appspot.com',
    measurementId: 'G-6XTZ5Q62JS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSuQQbtiwDxt8imAFxNFIsSfZ4wkuJ2zI',
    appId: '1:740690763276:android:5dfe3255e65b86d7845829',
    messagingSenderId: '740690763276',
    projectId: 'news-app-5539d',
    storageBucket: 'news-app-5539d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrrtIBNbwhus_ynh9_oEvxeSLkKdA1NyI',
    appId: '1:740690763276:ios:f9bf4746b4c5c6a1845829',
    messagingSenderId: '740690763276',
    projectId: 'news-app-5539d',
    storageBucket: 'news-app-5539d.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrrtIBNbwhus_ynh9_oEvxeSLkKdA1NyI',
    appId: '1:740690763276:ios:f9bf4746b4c5c6a1845829',
    messagingSenderId: '740690763276',
    projectId: 'news-app-5539d',
    storageBucket: 'news-app-5539d.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCRry66ksS-EqDkAu9hZQb1B1dMNSSHdYA',
    appId: '1:740690763276:web:0a5a8170beb9ed2d845829',
    messagingSenderId: '740690763276',
    projectId: 'news-app-5539d',
    authDomain: 'news-app-5539d.firebaseapp.com',
    storageBucket: 'news-app-5539d.appspot.com',
    measurementId: 'G-TZGS7XX3RG',
  );
}
