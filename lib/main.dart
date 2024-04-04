import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInDemo(),
    );
  }
}

class SignInDemo extends StatefulWidget {
  const SignInDemo({super.key});

  @override
  State<SignInDemo> createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  bool _isLoggedIn = false;

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
          .signIn();

      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      setState(() {
        _isLoggedIn = true;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login com Google'),
      ),
      body: Center(
        child: _isLoggedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Você está logado como: ${user.email}'),
                  ElevatedButton(
                    child: const Text('Logout'),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      setState(() {
                        _isLoggedIn = false;
                      });
                    },
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: googleLogin,
                child: const Text('Login com Google'),
              ),
      ),
    );
  }
}
