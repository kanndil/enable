import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './maps.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
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
              //mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Walk me to ...',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      //maps
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Maps()));
                    }),
                RaisedButton(
                  color: Colors.blueGrey,
                  child: Text(
                    'Full day company',
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
                    'Carry My ...',
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
                    'Other',
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
