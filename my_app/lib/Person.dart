import './includes.dart';

class Person {
  int age;
  var name = Name;
  var address = Address;
  int phoneNumber;
  int idNumber;
  int idDateOfIssue; //DDMMYYYY
  int idDateOfExpiry; //DDMMYYYY
  var rating;
  int ratingCounter;
  //app_statues CHECK LATER!!!

  Person() {
    rating = 0.0;

    // if (loading) {
    // LoadPersonFromDataBase();
    // }
  }

  void LoadPersonFromDataBase() {
    //loads data from database and server
  }

  void ModifyRating(int x) {
    ratingCounter++;
    rating = rating + x;
    rating = rating / ratingCounter;
  }
}
