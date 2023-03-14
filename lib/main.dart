import 'dart:convert';

import 'package:finalmobile/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root component
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingNow = [];
  List topRated = [];
  List popular = [];

  final String apikey = 'b917701c219e1bb41973c02592806036';

  void initState() {
    _getMovies();
    super.initState();
  }

  void _getMovies() async {
    //this is for the trending part
    Uri trendingApi = Uri.parse('https://api.themoviedb.org/3/trending/all/day?api_key=$apikey');
    final apiDataTrending = jsonDecode((await http.get(trendingApi)).body);

    // this is for the toprated part
    Uri topratedApi = Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=1');
    final apiDataToprated = jsonDecode((await http.get(topratedApi)).body);


    // this is for the popular part
    Uri popularApi = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=b917701c219e1bb41973c02592806036&language=en-US&page=1');
    final apiPopular = jsonDecode((await http.get(popularApi)).body);

    setState(() {
      trendingNow = apiDataTrending['results'].where((result) => result['media_type'] == 'movie').toList();
      topRated = apiDataToprated['results'];
      popular = apiPopular['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,

          title: Text("Movies",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold

              )),
        ),

        body:homePage(topRated: topRated,trendingNow: trendingNow, popular: popular,)

    );
  }
}
