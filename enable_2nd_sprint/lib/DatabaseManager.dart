import 'package:cloud_firestore/cloud_firestore.dart';
/*
class DatabaseManager {
  final CollectionReference profile =
      FirebaseFirestore.instance.collection("handicappedUsers");

  Future<void> createData(String name, String email, String address,
      String location, String uid) async {
    return await profile.doc(uid).set({
      'name': name,
      'address': address,
      'location': location,
      'email': email
    });
  }


  Future updateUserList(String name, String email, String address,
      String location, String uid) async {
    return await profile.doc(uid).update({
      'name': name,
      'address': address,
      'location': location,
      'email': email
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profile.get().then((querySnapshot) {
        querySnapshot.docs.elementAt(index)
        //forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (error) {         //catches errors
      print(error.toString());
      return null;
    }
  }
}
*/