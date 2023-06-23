// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:singin_firebase/auth.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth(),
    );
  }
}
