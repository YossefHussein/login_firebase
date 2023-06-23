// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singin_firebase/controller/login_State.dart';

import '../controller/login_cubit.dart';
import 'ui/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // this for if user don't use the text form the phone will stop the email password controller
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    LoginCubit.get(context).emailController.dispose();
    LoginCubit.get(context).passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, State) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
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
                      controller: cubit.emailController,
                      hintText: 'email',
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    textFieldWidget(
                      controller: cubit.passwordController,
                      hintText: 'password',
                      isPassword: true,
                      type: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10),
                    buttonWidget(
                      onTap: cubit.signIn,
                      title: 'sign In',
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not Have account?',
                          style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () => cubit.openSignUpScreen(context: context),
                          child: Text(
                            'make new account :) ',
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
      },
    );
  }
}
