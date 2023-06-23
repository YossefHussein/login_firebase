import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singin_firebase/controller/singup_states.dart';

import '../controller/signup_cubit.dart';
import 'ui/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // this for if user don't use the text form the phone will stop the email password controller
  @override
  void dispose() {
    super.dispose();
    SignUpCubit.get(context).emailController.dispose();
    SignUpCubit.get(context).confirmPasswordController.dispose();
    SignUpCubit.get(context).passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SingUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
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
                      controller: cubit.emailController,
                      hintText: 'email',
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),

                    /// this for confirm password
                    textFieldWidget(
                      controller: cubit.confirmPasswordController,
                      hintText: 'password',
                      isPassword: true,
                      type: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10),
                    textFieldWidget(
                      controller: cubit.passwordController,
                      hintText: 'confirm password',
                      isPassword: true,
                      type: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10),
                    // button for sign up
                    buttonWidget(
                      onTap: () {
                        cubit.signUp(context);
                      },
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
      },
    );
  }
}
