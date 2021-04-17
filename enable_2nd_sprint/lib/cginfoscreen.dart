import 'dart:async';
import 'package:flutter/material.dart';

class Cginfoscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CginfoscreenState();
}

class CginfoscreenState extends State<Cginfoscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xDD000000),
        appBar: AppBar(
          backgroundColor: const Color(0xDD000000),
          brightness: Brightness.dark,
          title: Container(
            width: double.infinity,
          ),
        ),
        body: Center(
          child: Image.asset('assets/waiting.jpg'),
        ),
      ),
    );
  }
}
