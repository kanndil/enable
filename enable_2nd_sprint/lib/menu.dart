import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './maps.dart';
import './maps.dart';
import './service_menu.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //  fetchDatabase();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF37474F),
      appBar: AppBar(
        backgroundColor: const Color(0xDD000000),
        title: Text('Menu'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Request Service',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      //maps
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ServiceScreen()));
                    }),
                RaisedButton(
                  color: Colors.blueGrey,
                  child: Text(
                    'Emergency!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Maps()));
                  },
                ),
                RaisedButton(
                  color: Colors.blueGrey,
                  child: Text(
                    'My Account',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Maps()));
                  },
                ),
              ],
            )),
      ),
    );
  }
}
