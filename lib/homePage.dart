import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'infoPage.dart';

class homePage extends StatelessWidget {
  List topRated = [];
  List trendingNow = [];
  List popular = [];

  homePage({
      required this.topRated,
      required this.trendingNow,
      required this.popular});

  Container container(String movieCollectionName, List movieList) {

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movieCollectionName, style: TextStyle(fontSize: 30, color: Colors.white)),
        SizedBox(height: 10),
        Container(
            height: 250,
            child: ListView.builder(
              itemCount: movieList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int counter) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => infoPage(
                                  movieList: movieList, index: counter)));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(5),
                        width: 150,
                        child: Column(
                          children: [
                            Container(
                                height: 200,
                                child: Image.network(
                                  'http://image.tmdb.org/t/p/w500' +
                                      movieList[counter]['poster_path'],
                                )),
                            Container(
                                child: Text(movieList[counter]['title'],
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white)))
                          ],
                        )));
              },
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 25),
        //this is the top rated movies
        container("Top Rated", topRated),
        SizedBox(height: 25),
        //this is the trending movies
        container("Trending", trendingNow),
        SizedBox(height: 25),
        //this is the popular movies
        container("Popular", popular),
      ],
    );
  }
}
