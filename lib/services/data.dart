import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  final String uid;
  Database({required this.uid});

  //collection reference
  final CollectionReference movielists = FirebaseFirestore.instance.collection('movies');

  Future updateData(String sugars,String name, int strength) async {
    return await movielists.doc(uid).set({
      'sugars':  sugars,
      'name': name,
      'strength':strength,
    });
  }

}