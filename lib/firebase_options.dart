import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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

  // Configurações para web permanecem as mesmas, assumindo que não foram fornecidas novas informações
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCcuHTXUjcrARZPZezfSM9HDMMVAlG1rgo',
    appId: '1:330798494050:web:41073dd43c48ce673e3c3b',
    messagingSenderId: '330798494050',
    projectId: 'foxapp-d3f9f',
    authDomain: 'foxapp-d3f9f.firebaseapp.com',
    storageBucket: 'foxapp-d3f9f.appspot.com',
    measurementId: 'G-4157DT3KPF',
  );

  // Atualize as configurações do Android com os novos valores
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0qcA2oXSJ-6zFrmrqhW3IggcI-oF9j4g', // Atualizado
    appId:
        '1:74998177914:android:fd602a37e11d15a3e41bc3', // Atualizado para corresponder ao mobilesdk_app_id
    messagingSenderId:
        '74998177914', // Atualizado para corresponder ao project_number
    projectId: 'flutter-login-cb915', // Já estava correto
    storageBucket: 'flutter-login-cb915.appspot.com', // Já estava correto
  );

  // As configurações do iOS permanecem inalteradas, pois já estão corretas
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmsbxK8CxP0guTH1Yt9oOIpU46lgMhtLY', // Correto conforme plist
    appId: '1:74998177914:ios:49ad419ee9a5943de41bc3', // Correto conforme plist
    messagingSenderId:
        '74998177914', // Corrigido para corresponder ao GCM_SENDER_ID
    projectId: 'flutter-login-cb915', // Correto conforme plist
    storageBucket: 'flutter-login-cb915.appspot.com', // Correto conforme plist
    iosClientId:
        '74998177914-22m2masjpk2g03q3g6haj8jge8ktn5pj.apps.googleusercontent.com',
    iosBundleId:
        'com.jsolutions.flutterLoginTest', // Corrigido para corresponder ao BUNDLE_ID
  );
}
