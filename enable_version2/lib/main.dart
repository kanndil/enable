import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:enable1/login.dart";

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
  //var db = Firebase.firestore();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
