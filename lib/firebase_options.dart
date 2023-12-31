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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBadSTIXQCyibUNElNJ-pwrRARVlKj5njc',
    appId: '1:1061084554386:android:b183995f1601bac68c324b',
    messagingSenderId: '1061084554386',
    projectId: 'eventbookingapp-7a883',
    storageBucket: 'eventbookingapp-7a883.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARZWXvG5Nze_WWhKCXJNSKM5Y-Mc9Oud8',
    appId: '1:1061084554386:ios:cf8673eadd36a3f78c324b',
    messagingSenderId: '1061084554386',
    projectId: 'eventbookingapp-7a883',
    storageBucket: 'eventbookingapp-7a883.appspot.com',
    androidClientId: '1061084554386-6t41i65rd5av6lhq6u0bgkipmvgngfli.apps.googleusercontent.com',
    iosClientId: '1061084554386-5fidos6rm5lcemgs4b3vuevnivosqrch.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventBookingApp',
  );
}
