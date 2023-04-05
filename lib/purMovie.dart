import 'package:finalmobile/purchases.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'models/Movie.dart';

class purMovie extends StatefulWidget {
  //const purMovie({Key? key}) : super(key: key);

  @override
  State<purMovie> createState() => _purMovieState();
}

class _purMovieState extends State<purMovie> {
  @override
  Widget build(BuildContext context) {

    print('frank');


    final movies = Provider.of<List<Movie>>(context);

//     movies.forEach((movies) {
//       print(movies.movieposter);
//       print(movies.moviename);
//       print(movies.price);
//
//     });
//
return Container(

);


    // return ListView.builder(
    //   itemCount:movies.length,
    //    itemBuilder: (BuildContext context, int index) {
    //     print('luuuuuuhhhhee');
    //     return purchases(details: movies[index]);
    // },
    // );
  }
}
