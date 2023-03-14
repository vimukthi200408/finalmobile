import 'dart:convert';

import 'package:finalmobile/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  //API KEY b917701c219e1bb41973c02592806036
  // api token eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTE3NzAxYzIxOWUxYmI0MTk3M2MwMjU5MjgwNjAzNiIsInN1YiI6IjYzZTM2YmJmNzMwNGI1MDA4NDYxOGYwZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VyRcRW2PMF_d8Lw6xFG3EqFfetNnK5TRESOxwwdp2ng

  List trendingNow = [];
  List topRated = [];
  List popular = [];

  final String apikey = 'b917701c219e1bb41973c02592806036';

  void initState() {
    _getMovies();
    super.initState();
  }

  void _getMovies() async {
    // final response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/all/day?api_key=b917701c219e1bb41973c02592806036"));
    // if (response.statusCode ==200){
    //   print("comes");
    //   trendingNow = jsonDecode(response.body)['results'];
    //  // print(apiDataTrending2["results"]);
    //  // Iterable list = apiDataTrending2["results"];

    //   //print(apiDataTrending2);
    //   //print(list[1]);
    // }




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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.navigation,
                color: Colors.white,
              ),
              onPressed: () {

                // do something
              },
            )
          ],
          title: Text("Movies",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold

              )),
        ),

        body:homePage(topRated: topRated,trendingNow: trendingNow, popular: popular,)

        // body: ListView(
        //   children: [
        //
        //
        //
        //
        //     //******-------------------this is the top rated movies
        //     Container(
        //         child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text("Top Rated movie",
        //             style: TextStyle(fontSize: 20, fontFamily: 'Roboto')),
        //         Container(
        //             height: 250,
        //             child: ListView.builder(
        //               itemCount: topRated.length,
        //               scrollDirection: Axis.horizontal,
        //               itemBuilder: (BuildContext context, int counter) {
        //                 return Container(
        //                     width: 150,
        //                     child: Column(
        //                       children: [
        //                         Container(
        //                           height: 200,
        //                           decoration: BoxDecoration(
        //                               image: DecorationImage(
        //                                   image: NetworkImage(
        //                                       'http://image.tmdb.org/t/p/w500' +topRated[counter]['poster_path']
        //
        //                                   ))),
        //                         ),
        //                         Container(
        //                             child: Text(topRated[counter]['title']))
        //                       ],
        //                     ));
        //               },
        //             ))
        //       ],
        //     )),
        //
        //
        //
        //
        //
        //     //******-------------------this is the trending movies
        //     Container(
        //         child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text("Trending Movies",
        //             style: TextStyle(fontSize: 20, fontFamily: 'Roboto')),
        //         Container(
        //             height: 250,
        //             child: ListView.builder(
        //               itemCount: trendingNow.length,
        //               scrollDirection: Axis.horizontal,
        //               itemBuilder: (BuildContext context, int counter) {
        //                 return Container(
        //                     width: 150,
        //                     child: Column(
        //                       children: [
        //                         Container(
        //                           height: 200,
        //                           decoration: BoxDecoration(
        //                               image: DecorationImage(
        //                                   image: NetworkImage(
        //                                       'http://image.tmdb.org/t/p/w500' +trendingNow[counter]['poster_path']))),
        //                         ),
        //                         Container(child: Text(trendingNow[counter]['title']!=null?
        //                         trendingNow[counter]['title']:'Loading',))
        //                       ],
        //                     ));
        //               },
        //             ))
        //
        //       ],
        //     )),
        //
        //     //this is for the trending movies
        //   ],
        // )
    );
  }
}
