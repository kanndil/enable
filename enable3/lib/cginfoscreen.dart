import 'dart:async';
import 'package:flutter/material.dart';

import 'menu.dart';

class Cginfoscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CginfoscreenState();
}

class CginfoscreenState extends State<Cginfoscreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 10);
    return new Timer(duration, next);
  }

  next() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MenuScreen()));
  }

  initScreen(BuildContext context) {
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
          child: Image.asset('assets/enable_logo.PNG'),
        ),
      ),
    );
  }
}

/*
class CginfoscreenState extends State<Cginfoscreen> {
  @override
  Widget in(BuildContext context) {
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
*/
