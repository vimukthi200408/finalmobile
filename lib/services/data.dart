import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Movie.dart';


class Database {

  final String uid;
  late final CollectionReference movielists;

  Database({ required this.uid})
  {
    movielists = FirebaseFirestore.instance.collection(uid);
  }

  //collection reference
  //final CollectionReference movielists = FirebaseFirestore.instance.collection('d');

  // Future updateData(String movieposter,String moviename,int option) async {
  //   return await movielists.doc(uid).set({
  //     'movieposter':  movieposter,
  //     'moviename': moviename,
  //     'option':option
  //   });
  // }

  Future updateData(String movieposter,String moviename,int option) async {
    return await movielists.add({
      'movieposter':  movieposter,
      'moviename': moviename,
      'option':option
    });
  }

  //movie list snapshot
  // List<Movie> movielistsnap(QuerySnapshot snapshot){
  //   return snapshot.docs.map((doc){
  //     return Movie(
  //     movieposter: doc.data['movieposter'] ?? 'yeyey',
  //     moviename: doc['moviename'] ?? 'yeye',
  //     option: doc['option'] ?? '0',
  //     );
  //   }).toList();
  // }

  List<Movie> movielistsnap(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      final data = doc.data() as Map<String, dynamic>; // Cast doc.data to Map<String, dynamic>
      return Movie(
        movieposter: data['movieposter'] ?? '',
        moviename: data['moviename'] ?? '',
        option: data['option'] ?? '0',
      );
    }).toList();
  }



  //get stream
  Stream<List<Movie>> get bought{
    return movielists.snapshots()
    .map(movielistsnap);
  }




}