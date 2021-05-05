import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

enum choices { SignOut }

class ScreenArguments {
  final String name;
  final String email;
  final String country;
  final String address;
  ScreenArguments(this.name, this.email, this.country, this.address);
}

class AccountScreen extends StatefulWidget {
  static const routeName = '/extractArguments';
  @override
  _AccountScreenState createState() => new _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    choices _selection;
    final ScreenArguments args =
        ModalRoute.of(context).settings.arguments as ScreenArguments;
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff5C5B59),
          title: Text('Personal Account'),
          actions: <Widget>[
            PopupMenuButton<choices>(
              color: const Color(0xffffffff),
              iconSize: 40.0,
              onSelected: (choices result) {
                setState(() {
                  _selection = result;
                });
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.black.withOpacity(0.8)),
              clipper: getClipper(),
            ),
            Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://scontent.fcai20-3.fna.fbcdn.net/v/t1.6435-9/138479205_1624917534359355_4322677741087185943_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=TtsVrsLl7iMAX9QR025&_nc_ht=scontent.fcai20-3.fna&oh=3cd531ccd9e945cbc7028f8af6e65cf5&oe=60B6FCBD'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ])),
                    SizedBox(height: 90.0),
                    Text(
                      args.name,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      args.email,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      args.country,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      args.address,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 25.0),

                    /*
                    Container(
                        height: 30.0,
                        width: 95.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Edit Name',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 25.0),
                    Container(
                        height: 30.0,
                        width: 95.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.redAccent,
                          color: Colors.red,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ))
*/
                  ],
                ))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

/*
class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
      backgroundColor: const Color(0xff707070),
      appBar: AppBar(
        backgroundColor: const Color(0xff5C5B59),
        title: Text('Handicapped User Registration: '),
      ),
      body: ListView(
        children: <Widget>[
          //padding: EdgeInsets.all(16),
          Container(
            padding: EdgeInsets.all(16),
            child: TextBox(
                child: Column(
                children: <Widget>[
                  Text(data)
                    Text:'Name: ',







            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      hintText: 'name',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill name Input';
                      }
                      // return 'Valid Name';
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),




      //),
    );
  }

  //color(int i) {}
}












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
      print(variable['location']);
      print(variable['address']);
    }

*/
