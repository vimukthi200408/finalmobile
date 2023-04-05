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

  List<Movie> details = [];
  purchases({required this.details});

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
        body: ListView.builder(
          itemCount: details.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                  margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(details[index].moviename),
                    ),
                    title: Text(details[index].movieposter),
                    subtitle: Text('\$ ${details[index].price}'),
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
