import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import "package:enable1/cginfoscreen.dart";

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  var myMarkers = HashSet<Marker>();

  Position currentPosition;

  var geoLocator = Geolocator();

  void locatePosition() async {
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
    //  final GoogleMapController controller = await _controller.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
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
            RaisedButton(
              color: Colors.blueGrey,
              child: Text(
                'Done',
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
