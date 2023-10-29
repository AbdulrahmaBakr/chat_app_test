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
    apiKey: 'AIzaSyAksMFsKQq51kKvZkGWMCtGh25FW9_ebZw',
    appId: '1:530486098166:web:3d290b672e967338b594d7',
    messagingSenderId: '530486098166',
    projectId: 'chat-app-2cca5',
    authDomain: 'chat-app-2cca5.firebaseapp.com',
    storageBucket: 'chat-app-2cca5.appspot.com',
    measurementId: 'G-KTCYFBH37Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAN3vUCCCCH9dX2U7cTlA-xyxGhxx2sjDE',
    appId: '1:530486098166:android:626bba23368766b0b594d7',
    messagingSenderId: '530486098166',
    projectId: 'chat-app-2cca5',
    storageBucket: 'chat-app-2cca5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBixKl2i2NVWSgsrd8y-TCFmxu5rXn2VZk',
    appId: '1:530486098166:ios:a8f110d9fbeae94ab594d7',
    messagingSenderId: '530486098166',
    projectId: 'chat-app-2cca5',
    storageBucket: 'chat-app-2cca5.appspot.com',
    iosClientId: '530486098166-kv906m0jchedmuunj1cm276evdine217.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBixKl2i2NVWSgsrd8y-TCFmxu5rXn2VZk',
    appId: '1:530486098166:ios:a8f110d9fbeae94ab594d7',
    messagingSenderId: '530486098166',
    projectId: 'chat-app-2cca5',
    storageBucket: 'chat-app-2cca5.appspot.com',
    iosClientId: '530486098166-kv906m0jchedmuunj1cm276evdine217.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}