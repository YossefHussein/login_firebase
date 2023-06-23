import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:singin_firebase/screen/login_screen.dart';
import 'screen/home_screen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // this for lenten on change in firebase
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
