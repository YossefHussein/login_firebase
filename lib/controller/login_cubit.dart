import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_State.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // login on app by firebase
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      // this for give data from field and move to firebase
      // 'trim()' mean give me text without this '
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

// go to sign up screen if user doesn't have account
  void openSignUpScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'singupScreen');
  }
}
