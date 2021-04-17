import './Person.dart';
//import './hadicapped.dart';

class CareGiver extends Person {
  var personDetails = Person;
  bool acceptRequest;
  String getHistory;
  //var handicapped = Handicapped;
  //var serviceRequested = handicapped.requestService;

  CareGiver(var p) {
    personDetails = p;
  }
}
