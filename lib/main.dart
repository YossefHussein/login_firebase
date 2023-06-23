// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth.dart';
import 'controller/login_cubit.dart';
import 'controller/signup_cubit.dart';
import 'view/home_screen.dart';
import 'view/login_screen.dart';
import 'view/signup_screen.dart';

void main(List<String> args) async {
  // this for if main function is async willing return screen
  WidgetsFlutterBinding.ensureInitialized();
  // this for use firebase sevres
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Auth(),
          'homeScreen': (context) => HomeScreen(),
          'singupScreen': (context) => SignUpScreen(),
          'loginScreen': (context) => LoginScreen(),
        },
      ),
    );
  }
}
