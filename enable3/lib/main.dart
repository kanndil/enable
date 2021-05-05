import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:enable1/firstscreen.dart";
import 'account.dart';
//import 'package:js/js.dart' as js;

// home: LoginScreen(),
// home: RegisterScreen2(),
// home: Maps(),
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AccountScreen.routeName: (context) => AccountScreen(),
      },
      home: Firstscreen(),
    );
  }
}

/*
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var interface_choices = ["Visual_button", "Voice Over_button"];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xDD000000),
        appBar: AppBar(
          backgroundColor: const Color(0xDD000000),
          brightness: Brightness.dark,
          title: Container(
            width: double.infinity,
            child: Text(
              "enable",
              style: TextStyle(fontSize: 32, fontFamily: 'RobotoMono'),
            ),
          ),
        ),
        body: Center(
          child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        ),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            //  children: <Widget>[
            child: ElevatedButton(
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 24, color: const Color(0xFFFFFFFF)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF424242),
                ),
              ),
              //    padding: EdgeInsets.all(50),
              onPressed: null,
            ),
            // child: Align(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 1.0)
            // child: FlutterLogo(
            //   size: 60,
            //    ),
            //  ),
            ),
        //  ],
      ),
      // drawer: Drawer(
      //child: // Populate the Drawer in the next step.
      //      ),
    );
  }
}
Center(
  child: Container(
    height: 120.0,
    width: 120.0,
    color: Colors.blue[50],
    child: Align(
      alignment: Alignment.topRight,
      child: FlutterLogo(
        size: 60,
      ),
    ),
  ),
)
*/
