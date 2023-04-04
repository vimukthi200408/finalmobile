import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalmobile/models/Movie.dart';
import 'package:finalmobile/purMovie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalmobile/services/data.dart';
import 'package:provider/provider.dart';
import 'package:finalmobile/services/firebaseauth.dart';

import 'models/user.dart';


class purchases extends StatelessWidget {
  const purchases({Key? key}) : super(key: key);

  //final FirebaseAuth _auth = FirebaseAuth();


  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<Bser>().uid;
    return StreamProvider<List<Movie>>.value(
      value: Database(uid: currentUser).bought,
    initialData: [],
    child: Scaffold(

      appBar: AppBar(
        title: Text('Purchased Items'),
      ),
      body: ListView(
        children: [
          purMovie(),
          Text('hello'),
          Text('hello2'),
          Text('hello3')
        ],
      ),
    ),
    );

  }
}
