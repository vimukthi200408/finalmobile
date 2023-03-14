import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class infoPage extends StatelessWidget {
  List movieList = [];
  int index;
  String color = "red";
  int size = 10;

  infoPage({required this.movieList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(movieList[index]['title']),
        ),
        body: Container(
            child: ListView(children: [
          //this is the backdrop
          Container(
              child: Positioned(
                  child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                          'http://image.tmdb.org/t/p/w500' +
                              movieList[index]['backdrop_path'],
                          fit: BoxFit.cover)))),
          //this is the row with poster and description
          Row(children: [
            Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network('http://image.tmdb.org/t/p/w500' +
                    movieList[index]['poster_path'])),
            Flexible(
                child: Container(
                    child: Text(movieList[index]['overview'],
                        style: TextStyle(fontSize: 16, color: Colors.white))))
          ]),
          //this is the title under the poster
          Container(
              child: Text(
                  movieList[index]['title'] != null
                      ? movieList[index]['title']
                      : 'Not Loaded',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          //this is the row with the rating and release date
          Row(children: [
            Container(
                child: Row(children: [
              Text('Rating - ' + movieList[index]['vote_average'].toString(),
                  style: TextStyle(color: Colors.white)),
              Icon(Icons.star, color: Colors.yellow, size: 20.0)
            ])),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(children: [
                  Text('Release Date - ' + movieList[index]['release_date'],
                      style: TextStyle(color: Colors.white)),
                  Icon(Icons.date_range, color: Colors.white, size: 20.1)
                ]))
          ]),
        ])));
  }
}
