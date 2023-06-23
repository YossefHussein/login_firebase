import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/styles/colors.dart';
import 'ui/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // this for if user don't use the text form the phone will stop the email password controller
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  // signUp on app by firebase
  Future signUp() async {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        // this for give data from field and move to firebase
        // 'trim()' mean give me text without this '
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushNamed(context, '/');
    } else {
      notPasswordMatch();
      return false;
    }
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
                  'images/elephant.png',
                  height: 150,
                ),
                const SizedBox(height: 10),
                Text(
                  'SING UP',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'HI BRO AGAIN :)',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                // this textfield for email
                textFieldWidget(
                  controller: _emailController,
                  hintText: 'email',
                ),
                const SizedBox(height: 10),

                /// this for confirm password
                textFieldWidget(
                    controller: _confirmPasswordController,
                    hintText: 'password',
                    isPassword: true),
                const SizedBox(height: 10),
                textFieldWidget(
                    controller: _passwordController,
                    hintText: 'confirm password',
                    isPassword: true),
                const SizedBox(height: 10),
                // button for sign up
                buttonWidget(
                  onTap: signUp,
                  title: 'signUp',
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ALREADY HAVE',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        'SIGN IN',
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
