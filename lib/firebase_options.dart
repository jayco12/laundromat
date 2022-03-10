// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCCtj2vMbNQuqPK8QuFQj8aKje0ohmHEqg',
    appId: '1:113720634936:web:2ff7bead9d7d310e6bc0cd',
    messagingSenderId: '113720634936',
    projectId: 'laundromat-607aa',
    authDomain: 'laundromat-607aa.firebaseapp.com',
    databaseURL: 'https://laundromat-607aa-default-rtdb.firebaseio.com',
    storageBucket: 'laundromat-607aa.appspot.com',
    measurementId: 'G-WJB4PPPEWJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2QLn61DvJ3w6-XD8Z0f3MKVuwToFkCAI',
    appId: '1:113720634936:android:6efa2b55b53412f86bc0cd',
    messagingSenderId: '113720634936',
    projectId: 'laundromat-607aa',
    databaseURL: 'https://laundromat-607aa-default-rtdb.firebaseio.com',
    storageBucket: 'laundromat-607aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAFtBW6NMrOMesCXRAck2BNsG68C8QwgU',
    appId: '1:113720634936:ios:d8d16db3eea7d4176bc0cd',
    messagingSenderId: '113720634936',
    projectId: 'laundromat-607aa',
    databaseURL: 'https://laundromat-607aa-default-rtdb.firebaseio.com',
    storageBucket: 'laundromat-607aa.appspot.com',
    iosClientId: '113720634936-etoinjg29qqn7q4lt1lo3562ohh2sctf.apps.googleusercontent.com',
    iosBundleId: 'com.laundromat.laundroma',
  );
}
