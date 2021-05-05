import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import "package:enable1/cginfoscreen.dart";

import 'login.dart';

enum choices { SignOut }

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  var myMarkers = HashSet<Marker>();

  Position currentPosition;

  var geoLocator = Geolocator();

  void locatePosition() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    print('longitude: ');
    print(latLngPosition.longitude);
    print('latitude: ');
    print(latLngPosition.latitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);

    var firebaseUser = FirebaseAuth.instance.currentUser;

    firestore.collection('handicappedUsers').doc(firebaseUser.uid).update({
      'longitude': latLngPosition.longitude,
      'onRequest': true,
      'latitude': latLngPosition.latitude,
    });

    //  final GoogleMapController controller = await _controller.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    choices _selection;
    return Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
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
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(30.092172, 31.339965), zoom: 20),
              onMapCreated: (GoogleMapController googleMapController) {
                locatePosition();
                setState(() {
                  myMarkers.add(
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(30.092172, 31.339965),
                      infoWindow: InfoWindow(
                        title: 'Your current location',
                        snippet: 'Move To Set ',
                      ),
                    ),
                  );
                });
              },
              markers: myMarkers,
            ),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Cginfoscreen()));
              },
            ),
          ],
        ));
  }
}
