import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './maps.dart';
import 'login.dart';

enum choices { SignOut }

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
    choices _selection;
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        backgroundColor: const Color(0xff5C5B59),
        title: Text('Menu'),
        actions: <Widget>[
          PopupMenuButton<choices>(
            color: const Color(0xffffffff),
            iconSize: 40.0,
            onSelected: (choices result) {
              setState(() {
                _selection = result;
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<choices>>[
              const PopupMenuItem<choices>(
                value: choices.SignOut,
                child: Text('sign out'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        /*child: DropdownButton(
            hint: Text('Please choose a location'), // Not necessary for Option 1
            value: _selectedLocation,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),*/

        //padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessible_rounded,
                  color: const Color(0xffffffff),
                  size: 60.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                SizedBox(height: 30),
                RaisedButton.icon(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: const Color(0xff77B09A),
                    label: Text(
                      'Walk me to ...',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      //maps
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Maps()));
                    },
                    icon: Icon(Icons.elderly_outlined)),
                SizedBox(height: 20),
                RaisedButton.icon(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: const Color(0xff77B09A),
                    label: Text(
                      'Full day company',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Maps()));
                    },
                    icon: Icon(Icons.group_outlined)),
                SizedBox(height: 20),
                RaisedButton.icon(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: const Color(0xff77B09A),
                    label: Text(
                      'Carry My ...',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Maps()));
                    },
                    icon: Icon(Icons.business_center_outlined)),
                SizedBox(height: 20),
                RaisedButton.icon(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: const Color(0xff77B09A),
                    label: Text(
                      'Others',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Maps()));
                    },
                    icon: Icon(Icons.more_horiz_outlined)),
              ],
            )),
      ),
    );
  }
}
