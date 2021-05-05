import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import './maps.dart';
import 'dart:async';
import 'dart:core';

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
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
        title: Text('Requesting...'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Back to request',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      //maps
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Maps()));
                    }),
              ],
            )),
      ),
    );
  }
}
