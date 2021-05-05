import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './maps.dart';
import './maps.dart';
import './service_menu.dart';
import 'account.dart';
import 'login.dart';

enum choices { SignOut }

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
    //
    choices _selection;
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        backgroundColor: const Color(0xff5C5B59),
        title: Text('Menu'),
        /*actions: <Widget>[
          PopupMenuButton(
            onSelected: (link value) {
              setState(() {
                //print the selected option
                print(value);

                //Update the current choice.
                //choice = displayString(value);
              });
            },
            itemBuilder: (BuildContext context) {
              return link.values.map((link) {
                return PopupMenuItem(
                  value: link,
                  //child: Text(displayString(link)),
                );
              }).toList();
            },
          ),
        ],*/

        /* actions: <Widget>[
          PopupMenuButton(
              color: const Color(0xffffffff),
              iconSize: 40.0,
              onSelected: (choice) => choiceAction(choice, context),
              itemBuilder: (BuildContext context) {
                return MenuOptions.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
        ],*/

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
          //padding: EdgeInsets.all(16),
          //child: Form(
          //key: _formkey,
          child: Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Icon(
            Icons.accessible_rounded,
            color: const Color(0xffffffff),
            size: 60.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          SizedBox(height: 30),
          RaisedButton.icon(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              color: const Color(0xff77B09A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              label: Text(
                'Request Service',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                //maps
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ServiceScreen()));
              },
              icon: Icon(Icons.view_list_outlined)),
          SizedBox(height: 20),
          RaisedButton.icon(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 45),
              color: const Color(0xff77B09A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              label: Text(
                'Emergency!',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Maps()));
              },
              icon: Icon(Icons.warning_amber_outlined)),
          SizedBox(height: 20),
          RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
              color: const Color(0xff77B09A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Text(
                'My Account',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                var result = FirebaseAuth.instance.currentUser;
                // Now the database returns an object
                if (result != null) {
                  ///////////////////////////////////////////////////
                  print('welcome');
                  print(result.uid);
                  //////////////////////////////hear we have an handicapped user that needs to be retuned into the main function for later work
                  //  var getUser = FirebaseAuth.instance.currentUser;
                  //   handiuser.uI = getUser.uid;
                  DocumentSnapshot variable = await FirebaseFirestore.instance
                      .collection('handicappedUsers')
                      .doc(result.uid)
                      .get();
                  print(variable['name']);
                  print(variable['email']);
                  //print(variable['country']);
                  //print(variable['address']);
                  Navigator.pushNamed(
                    context,
                    AccountScreen.routeName,
                    arguments: ScreenArguments(
                      variable['name'],
                      variable['email'],
                      variable['country'],
                      variable['address'],
                    ),
                  );
                } else {
                  print('user not found');
                  // or redirect to the correct page
                }
              }),
          /*
          RaisedButton.icon(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 45),
              color: const Color(0xff77B09A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              label: Text(
                'My Account',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AccountScreen()));
              },
              icon: Icon(Icons.person_outline_outlined)),
              */
        ],
      )),
      //),
    );
  }

  //color(int i) {}
}

/*String MenuOptions (choices choice){
  switch (choice){
    case choices.SignOut:
    return "Sign out";
    break;
  }


  //static Object SignOut;
}*/
/*
void choiceAction(String choice, BuildContext context) {
  setState() {
    if (choice == MenuOptions.SignOut) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }
}

mixin SignOut {
}

//class SignOut {
//}
*/
