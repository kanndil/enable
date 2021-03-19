import 'dart:developer';

import './includes.dart';
import './Person.dart';
import './care_giver.dart';

class Handicapped extends Person {
  //name = Name;
  //address = Address;

  //var personDetails = Person; //not needed
  Disability disability; //
  var relative = Person;
  Service services;
  String uI;
  var caregiver =
      CareGiver; //This is not always availbe but when there is a request accpted by a caregiver, the care giver get stored here to access his contact for the handicapped
  var requestService = Servicetype; //Type of service if there any

//methods
  Handicapped(var p, Disability d, var r) {
    //change person yo relative
    //  this.personDetails = p; //var type to be reviewed
    this.disability = d;
    this.relative = r; //var type to be reviewed
  }

  void SetService(Service s) {
    this.services = s;
  }
}
