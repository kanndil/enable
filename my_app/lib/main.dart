import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var interface_choices = ["Visual_button", "Voice Over_button"];
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF0F323A),
          appBar: AppBar(
            backgroundColor: const Color(0x30033049),
            title: Container(
              width: double.infinity,
              child: Text(
                "enable",
                style: TextStyle(fontSize: 32, fontFamily: 'RobotoMono'),
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text(
                  interface_choices[0],
                  style:
                      TextStyle(fontSize: 24, color: const Color(0xFFFFFFFF)),
                ),
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              ElevatedButton(
                child: Text(
                  interface_choices[1],
                  style:
                      TextStyle(fontSize: 24, color: const Color(0xFFFFFFFF)),
                  textAlign: TextAlign.center,
                ),
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ],
          ),
          drawer: Drawer(
              //child: // Populate the Drawer in the next step.
              )),
    );
  }
}
