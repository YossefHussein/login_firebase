// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // login on app by firebase
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      // this for give data from field and move to firebase
      // 'trim()' mean give me text without this '
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  void openSignUpScreen() {
    Navigator.pushReplacementNamed(context, 'singupScreen');
  }

  // this for if user don't use the text form the phone will stop the email password controller
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// this image of app
                Image.asset(
                  'images/koala.png',
                  height: 150,
                ),
                const SizedBox(height: 10),
                Text(
                  'SING IN',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome back to see you angle :)',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                textFieldWidget(
                  controller: _emailController,
                  hintText: 'email',
                ),
                const SizedBox(height: 10),
                textFieldWidget(
                    controller: _passwordController,
                    hintText: 'password',
                    isPassword: true),
                const SizedBox(height: 10),
                buttonWidget(
                  onTap: signIn,
                  title: 'signUp',
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not Have account make new it...',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: openSignUpScreen,
                      child: Text(
                        'make new account ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
