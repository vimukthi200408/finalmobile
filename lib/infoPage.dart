import 'package:finalmobile/services/data.dart';
import 'package:finalmobile/services/firebaseauth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'models/user.dart';


class infoPage extends StatelessWidget {
  List movieList = [];
  int index;
  int price = 0;

  infoPage({required this.movieList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movieList[index]['title']),
        ),
      body: Container(
        child: ListView(
          children: [

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
                  height: 150,
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
              SizedBox(height: 50,),
              Container(
                  child: Row(children: [
                Text('Rating - ' + movieList[index]['vote_average'].toString(),
                    style: TextStyle(color: Colors.white)),
                Icon(Icons.star, color: Colors.yellow, size: 20.0)
              ])),
              SizedBox(width: 30),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(children: [
                    Text('Release Date - ' + movieList[index]['release_date'],
                        style: TextStyle(color: Colors.white)),
                    Icon(Icons.date_range, color: Colors.white, size: 20.1)
                  ]))
            ]),

            // is the text for option to purchase
            Container(
              child:Text("Select the option of purchase : -",style: TextStyle(fontSize:15,color: Colors.blue,fontWeight: FontWeight.bold),),
            ),

            //text on top of the options
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(width: 10),
                    Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Standard Disc case  \$7",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 20),
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "StealBook Edition (Metal Case/ Movie art engrave to case)  \$15",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 20),
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Collector's Edition Box Set (includes: Metal case, Posters, Concept Art book) \n \$50",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            //these are the options
            Padding(
                padding:EdgeInsets.only(top: 10,bottom: 10),
                child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      SizedBox(width: 10),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red[300],
                        ),
                        child:ClipOval(
                          child:Image.asset('assets/bluray2.png',
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,),

                        ),

                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red[300],
                        ),
                        child:ClipOval(
                          child:Image.asset('assets/metalbox.png',
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,),

                        ),

                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red[300],
                        ),


                        child:ClipOval(
                          child:Image.asset('assets/box2.jpeg',

                            width: 100,
                            height: 100,),

                        ),

                      ),

                    ]

                ),

            ),

            //3 buttons to select one
            ToggleSwitch(
          minWidth: 150,
          cornerRadius: 30,
          initialLabelIndex: 0,
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey,
          inactiveFgColor: Colors.white,
          labels: ['Option 1', 'Option 2', 'Option 3'],
          onToggle: (ans) {
            if (ans == 0){
              price = 7;
            }else if (ans == 1){
              price = 15;
            }else if (ans == 2){
              price = 50;
            }
          },
        ),

            //the buy now button
            Padding(
                  padding: EdgeInsets.only(top: 50,bottom: 30),
                  child:StreamProvider<Bser>.value(
                    value:FireBaseAuth().user,
                    initialData: Bser(uid: 'risk'),
                    catchError: (context, error) {
                      print('Erreeer: $error');
                      return Bser(uid: 'risk');
                    },
                    child: Center(
                      child: SizedBox(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            // final userStream = context.watch<Stream<Bser>>();
                            // final currentUser = userStream.data?.uid;
                            // print('Current user UID: $currentUser');

                            final currentUser = context.read<Bser>().uid;
                            print('Current user UID: $currentUser');

                            await Database(uid:currentUser).updateData(movieList[index]['title'], 'http://image.tmdb.org/t/p/w500'+movieList[index]['poster_path'],price);
                          },
                          child: Text('Buy Now'),
                        ),
                      ),
                    ),
                  ),
                ),

          ]
        )
      ),
    );
  }
}
