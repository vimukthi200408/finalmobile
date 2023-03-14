
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'infoPage.dart';



class homePage extends StatelessWidget {

  List topRated = [];
  List trendingNow=[];
  List popular=[];

  // homePage({Key? key}) : super(key: key);

  homePage({required this.topRated ,required this.trendingNow,required this.popular});
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        SizedBox(height: 25),




        //******-------------------this is the top rated movies
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Top Rated",
                style: TextStyle(fontSize: 30,color: Colors.white)),
            SizedBox(height: 10),
            Container(

                height: 250,
                child: ListView.builder(
                  itemCount: topRated.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int counter) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => infoPage(topRated:topRated,index: counter)));

                        },
                    child:Container(
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
                                  'http://image.tmdb.org/t/p/w500' + topRated[counter]['poster_path'],
                                )
                            ),


                            Container(
                                child: Text(topRated[counter]['title'],style: TextStyle(fontSize: 13,color: Colors.white)))
                          ],
                        )));
                  },
                ))
          ],
        )),


        SizedBox(height:25),


        //******-------------------this is the trending movies
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trending",
                style: TextStyle(fontSize: 30,color: Colors.white)),
            SizedBox(height: 10),
            Container(
                height: 250,
                child: ListView.builder(
                  itemCount: trendingNow.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int counter) {
                    return Container(
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
                                          'http://image.tmdb.org/t/p/w500' +trendingNow[counter]['poster_path']),

                            ),
                            Container(child: Text(trendingNow[counter]['title']!=null?
                            trendingNow[counter]['title']:'Loading',style: TextStyle(fontSize: 13,color: Colors.white)))
                          ],
                        ));
                  },
                ))

          ],
        )),

        SizedBox(height: 25),
        //******-------------------this is the popular movies
        Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Popular",
                    style: TextStyle(fontSize: 30,color: Colors.white)),
                SizedBox(height: 10),
                Container(
                    height: 250,
                    child: ListView.builder(
                      itemCount: popular.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int counter) {
                        return Container(
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
                                              'http://image.tmdb.org/t/p/w500' +popular[counter]['poster_path']),
                                ),
                                Container(child: Text(popular[counter]['title']!=null?
                                popular[counter]['title']:'Loading',style: TextStyle(fontSize: 13,color: Colors.white)))
                              ],
                            ));
                      },
                    ))

              ],
            )),
        //this is for the trending movies
      ],
    );
  }
}
