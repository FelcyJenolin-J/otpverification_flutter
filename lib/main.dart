import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Login_project/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
//https://www.youtube.com/watch?v=l_DqmTQ5dHQ