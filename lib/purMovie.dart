import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'models/Movie.dart';

class purMovie extends StatefulWidget {
  const purMovie({Key? key}) : super(key: key);

  @override
  State<purMovie> createState() => _purMovieState();
}

class _purMovieState extends State<purMovie> {
  @override
  Widget build(BuildContext context) {
    
    final movies = Provider.of<List<Movie>>(context);
    //print(movies.docs);
    print('frsnk');

    movies.forEach((movies) {
      print('bluebeetle');
      print(movies.movieposter);
      print(movies.moviename);
      print(movies.option);

    });
    return Container(
      
    );
  }
}
