import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './handicapped.dart';
import './register2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:enable1/menu.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  List userslist = [];

  @override
  void initState() {
    super.initState();
    //  fetchDatabase();
  }

/*
  fetchDatabase() async {
    dynamic readUser = await DatabaseManager().getUsersList();

    if (readUser == null) {
      print("data were not read with errors");
    } else {
      setState(() {
        userslist = readUser;
      });
    }
  }
*/
  var handiuser = Handicapped();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xff707070),
      appBar: AppBar(
        backgroundColor: const Color(0xff5C5B59),
        title: Text('Login To My Account'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Email Input';
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Password Input';
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(height: 60),
                RaisedButton.icon(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    color: const Color(0xff77B09A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    label: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        var result = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailcontroller.text,
                                password: _passwordcontroller.text);
                        print(result);
                        // Now the database returns an object
                        if (result != null) {
                          ///////////////////////////////////////////////////
                          print('welcome');
                          print(result.user.uid);
//////////////////////////////hear we have an handicapped user that needs to be retuned into the main function for later work
                          //  var getUser = FirebaseAuth.instance.currentUser;
                          //   handiuser.uI = getUser.uid;
                          DocumentSnapshot variable = await FirebaseFirestore
                              .instance
                              .collection('handicappedUsers')
                              .doc(result.user.uid)
                              .get();
                          print(variable['name']);
                          print(variable['email']);
                          print(variable['location']);
                          print(variable['address']);

                          //   handiuser.emaiÍl = getUser.email;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MenuScreen()));
                        } else {
                          print('user not found');
                          // or redirect to the correct page
                        }
                      }
                    },
                    icon: Icon(Icons.account_box_outlined)),
                SizedBox(height: 20),
                RaisedButton.icon(
                    color: const Color(0xff77B09A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    label: Text(
                      'Register Handicapped User',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen2()));
                    },
                    icon: Icon(Icons.accessible_rounded)),
              ],
            )),
      ),
    );
  }
}
