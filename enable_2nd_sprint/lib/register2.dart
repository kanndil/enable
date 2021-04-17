import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:enable1/menu.dart";

class RegisterScreen2 extends StatefulWidget {
  @override
  _RegisterScreen2State createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _countrycontroller = TextEditingController();

  TextEditingController _controller = TextEditingController();

  TextEditingController _idDateOfIssuecontroller = TextEditingController();

  TextEditingController _addresscontroller = TextEditingController();

  TextEditingController _agilitycontroller = TextEditingController();

  TextEditingController _blindcontroller = TextEditingController();

  TextEditingController _caregiverIDcontroller = TextEditingController();

  TextEditingController _deafcontroller = TextEditingController();

  TextEditingController _expiryDatecontroller = TextEditingController();

  TextEditingController _idNumbercontroller = TextEditingController();

  TextEditingController _oldcontroller = TextEditingController();

  TextEditingController _phoneNumbercontroller = TextEditingController();

  TextEditingController _ratingcontroller = TextEditingController();

  TextEditingController _ratingCountercontroller = TextEditingController();

  TextEditingController _relativeIDcontroller = TextEditingController();

  TextEditingController _requestServicecontroller = TextEditingController();

  TextEditingController _serviceIDcontroller = TextEditingController();

  @override
  void dispose() {
    _namecontroller.dispose();

    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    _countrycontroller.dispose();

    _idDateOfIssuecontroller.dispose();

    _addresscontroller.dispose();

    _agilitycontroller.dispose();

    _blindcontroller.dispose();

    _caregiverIDcontroller.dispose();

    _deafcontroller.dispose();

    _expiryDatecontroller.dispose();

    _idNumbercontroller.dispose();

    _oldcontroller.dispose();

    _phoneNumbercontroller.dispose();

    _ratingcontroller.dispose();

    _ratingCountercontroller.dispose();

    _relativeIDcontroller.dispose();

    _requestServicecontroller.dispose();

    _serviceIDcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // TODO: implement build
    var textFormField = TextFormField(
      controller: _relativeIDcontroller,
      decoration: InputDecoration(
        hintText: 'IDcontroller',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please relative ID  REMOVECountry';
        }
      },
    );
    return Scaffold(
      backgroundColor: const Color(0xFF37474F),
      appBar: AppBar(
        backgroundColor: const Color(0xDD000000),
        title: Text('Handicapped User Registration: '),
      ),
      body: ListView(
        children: <Widget>[
          //padding: EdgeInsets.all(16),
          Container(
            padding: EdgeInsets.all(16),
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
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                    height: 20,
                  ),
                  TextFormField(
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: _countrycontroller,
                    decoration: InputDecoration(
                      hintText: 'Country',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Country Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _idDateOfIssuecontroller,
                    decoration: InputDecoration(
                      hintText: '(DDMMYYYY)',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill ID Date of Issue Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _addresscontroller,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Address Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.blueGrey,
                    child: Text(
                      'Resgister Handicapped User',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        var result = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailcontroller.text,
                                password: _passwordcontroller.text);
                        if (result != null) {
                          //The collection in our case is handicappedUsers and so I updated it in the collection
                          //result.id in document puts the same ID as the Authentication ID as to link the user to his data
                          var firebaseUser = FirebaseAuth.instance.currentUser;
                          firebaseUser = result.user;
                          firestore
                              .collection('handicappedUsers')
                              .doc(firebaseUser.uid)
                              .set({
                            'name': _namecontroller.text,
                            'country': _countrycontroller.text,
                            'email': _emailcontroller.text,
                            'password': _passwordcontroller.text,
                            'idDateOfIssue': _idDateOfIssuecontroller.text,
                            'address': _addresscontroller.text,
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MenuScreen()));
                        } else {
                          print('please try later');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
                        'agility': _agilitycontroller.text,
                        'blind': _blindcontroller.text,
                        'caregiver': _caregiverIDcontroller.text,
                        'deaf': _deafcontroller.text,
                        'expirydate': _expiryDatecontroller.text,
                        'idNumber': _idNumbercontroller.text,
                        'phoneNumber': _phoneNumbercontroller.text,
                        'rating': _ratingcontroller.text,
                        'ratingCounter': _ratingCountercontroller.text,
                        'relativeID': _relativeIDcontroller.text,
                        'requestService': _requestServicecontroller.text,
                        'serviceID': _serviceIDcontroller.text
                        */

/*SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _agilitycontroller,
                    decoration: InputDecoration(
                      hintText: '(y/n)',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Agility Input';
                      }
                    },
                  ),*/
/*SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _blindcontroller,
                    decoration: InputDecoration(
                      hintText: '(y/n)',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Blind Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    //WE NEED TO MODIFY THIS FIELD HOWEVER WE NEED TO HAVE THIS IN OUR
                    // DATA BASED AS TO FILL IT LATER ON
                    //
                    controller: _caregiverIDcontroller,
                    decoration: InputDecoration(
                      hintText: 'CaregiverID',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill  REMOVEEEEEE Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _deafcontroller,
                    decoration: InputDecoration(
                      hintText: 'y/n',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Deaf Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _expiryDatecontroller,
                    decoration: InputDecoration(
                      hintText: 'Country',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Expiry Date of ID Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _idNumbercontroller,
                    decoration: InputDecoration(
                      hintText: 'Country',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill ID Number Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _oldcontroller,
                    decoration: InputDecoration(
                      hintText: '(y/n)',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Old Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _phoneNumbercontroller,
                    decoration: InputDecoration(
                      hintText: '01234567890',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Phone Number Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _ratingcontroller,
                    decoration: InputDecoration(
                      hintText: 'Country',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please REMOOVEEEEEEE Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _ratingCountercontroller,
                    decoration: InputDecoration(
                      hintText: 'Country',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please REMOVEEEE Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textFormField,
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _requestServicecontroller,
                    decoration: InputDecoration(
                      hintText: 'requestService',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Request Service Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _serviceIDcontroller,
                    decoration: InputDecoration(
                      hintText: 'Country',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Service ID REMOOOOVEEEEEEE Input';
                      }
                    },
                  ),*/
