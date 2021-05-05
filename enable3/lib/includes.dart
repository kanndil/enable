import 'dart:async';
import 'package:flutter/material.dart';

class Name {
  String firstName;
  String middleName;
  String lastName;

// methods
  Name(String f, String m, String l) {
    this.firstName = f;
    this.middleName = m;
    this.lastName = l;
  }
}

class Address {
  int buildingNumber;
  String street;
  String city;
  String postalCode;
  String country;
  int x; //Coordinates
  int y; //Coordinates
}

// methods intgrating API thta will be dilivered in upcomingmilestones
class Servicetype {
  String serviceName;
  double sericeSla;
  String serviceDescription;
  int numOfReqCG;
  double avgTime;
  int counter;
}

enum Disability {
  blind,
  deaf,
  old,
  agility,
}

enum ServiceList {
  emergency,
  walkGuidance,
  transporation,
  lifting,
}

enum ServiceStatus {
  done,
  dimissed,
  ongoing,
}
