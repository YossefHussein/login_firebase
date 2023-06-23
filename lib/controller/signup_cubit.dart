import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/ui/widgets/widgets.dart';
import 'singup_states.dart';

class SignUpCubit extends Cubit<SingUpState> {
  SignUpCubit() : super(SingUpInitial());

  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // signUp on app by firebase
  Future signUp(BuildContext context) async {
    // if password is not match give for user message the
    //password is not match
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      // this for add email and password to database if password match
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        // this for give data from field and move to firebase
        // 'trim()' mean give me text without this '
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // this for go to auth screen
      Navigator.pushNamed(context, '/');
    } else {
      // this is password is not match
      notPasswordMatch();
      return false;
    }
  }
}
