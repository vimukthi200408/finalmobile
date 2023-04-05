import 'dart:convert';

import 'package:finalmobile/homePage.dart';
import 'package:finalmobile/purMovie.dart';
import 'package:finalmobile/purchases.dart';
import 'package:finalmobile/services/data.dart';
import 'package:finalmobile/services/firebaseauth.dart';
import 'package:finalmobile/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'models/Movie.dart';
import 'models/user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  print("comes here1");
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDn-ceTsk2j4ZvFKM6EOs1VgC9yLpVVo1Y",
        appId: "1:66206032117:android:d8837fc479b48c297be5bc",
        messagingSenderId: "66206032117",
        projectId: "movie-app-3f126",)
  );
  print("comes here2");
     //options: Firebase.initializeApp(

  //);
      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root component
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Bser>.value(
      value:FireBaseAuth().user,
      initialData: Bser(uid: 'risk'),
      catchError: (context, error) {
        print('Erreeer: $error');
        return Bser(uid: 'risk');
        // or return a default value to use instead of null
      },
      child: MaterialApp(
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
         //home: const MyHomePage(),
        home:Wrapper(),
      ),
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
  final FireBaseAuth _auth = FireBaseAuth();
  List<Movie> movieList = [];
  final Database database = Database(uid: '1NTaFBuF6aba8afKEFHt9ZAWQHv2');
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

              )
          ),
        ),
        drawer: NavigationDrawer(children: [
          Container(
            padding: EdgeInsets.only(
              top: 20,
            ),
          ),
          Column(
            children: [
              ListTile(
                leading:Icon(Icons.person),
                title:Text("logout"),
                onTap: () async{
                  print("1");
                  print(await _auth.signingOut());
                  print("2");
                },
              )
            ],
          ),
          Column(
            children: [
              ListTile(
                leading:Icon(Icons.shopping_cart),
                title:Text("Purchases"),
                onTap: () async {
                  List<Movie> newList = await database.bought.first;
                  setState(()=>movieList = newList);
                  print('gamer');
                  print(movieList[0].movieposter);
                  purchases Purchases = purchases(details: movieList,);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Purchases));


                },
                // onTap: () {
                //   //Navigator.push(context, MaterialPageRoute(builder: (context) => purMovie()));
                //   //purMovie();
                //   // final defDetails = {
                //   //   'movieposter': 'hello',
                //   //   'moviename': 'hello',
                //   //   'price': 0,
                //   // };
                //   print('jason');
                //   final movies = Provider.of<List<Movie>>(context);
                //   print('bong');
                //   print(movies[0]);
                //
                //
                //
                //   Movie movie = Movie(moviename: "The Shawshank Redemption", movieposter: "https://www.example.com/shawshank_redemption_poster.jpg", price: 10);
                //   print(movie);
                //   purchases Purchases = purchases(details: movies,);
                //   //purchases Purchases = purchases(details: defDetails);
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => Purchases));
                // },
              )
            ],
          ),


          

        ],),

        body:
        //purMovie(),
        homePage(topRated: topRated,trendingNow: trendingNow, popular: popular,)

    );
  }
}

class NavigationDrawer2 extends StatefulWidget {

//  NavigationDrawer2({Key? key}) : super(key: key);

  // List<Movie> movieList = [];
  // final Database database = Database(uid: 'H2L8DAcLOvM6iX0Z8Zji1nN1gC03');



  @override
  State<NavigationDrawer2> createState() => _NavigationDrawer2State();
}

class _NavigationDrawer2State extends State<NavigationDrawer2> {
  final FireBaseAuth _auth = FireBaseAuth();
  List<Movie> movieList = [];
   final Database database = Database(uid: 'H2L8DAcLOvM6iX0Z8Zji1nN1gC03');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          Container(
            padding: EdgeInsets.only(
              top: 20,
            ),
          ),
          Column(
            children: [
              ListTile(
                leading:Icon(Icons.person),
                title:Text("logout"),
                onTap: () async{
                  print("1");
                  print(await _auth.signingOut());
                  print("2");
                },
              )
            ],
          ),Column(
            children: [
              ListTile(
                leading:Icon(Icons.shopping_cart),
                title:Text("Purchases"),
                onTap: () async {
                  List<Movie> newList = await database.bought.first;
                  setState(()=>movieList = newList);

                },
              )
            ],
          ),

        ],
      ),
    );
  }
}




// class NavigationDrawer extends StatelessWidget {
//
//   List<Movie> movieList = [];
//   final Database database = Database(uid: 'H2L8DAcLOvM6iX0Z8Zji1nN1gC03');
//
//
//   NavigationDrawer({Key? key}) : super(key: key);
//
//   final FireBaseAuth _auth = FireBaseAuth();
//
//   @override
//   Widget build(BuildContext context) => Drawer(
//     child:SingleChildScrollView(
//       child:Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children:<Widget>[
//           Container(
//             padding: EdgeInsets.only(
//               top: 20,
//             ),
//           ),
//           Column(
//             children: [
//               ListTile(
//                 leading:Icon(Icons.person),
//                 title:Text("logout"),
//                 onTap: () async{
//                   print("1");
//                   print(await _auth.signingOut());
//                   print("2");
//                 },
//               )
//             ],
//           ),
//           Column(
//             children: [
//               ListTile(
//                 leading:Icon(Icons.shopping_cart),
//                 title:Text("Purchases"),
//                 onTap: () async {
//                   List<Movie> newList = await database.bought.first;
//                   setState(()=>movieList = newList);
//
//                 },
//                 // onTap: () {
//                 //   //Navigator.push(context, MaterialPageRoute(builder: (context) => purMovie()));
//                 //   //purMovie();
//                 //   // final defDetails = {
//                 //   //   'movieposter': 'hello',
//                 //   //   'moviename': 'hello',
//                 //   //   'price': 0,
//                 //   // };
//                 //   print('jason');
//                 //   final movies = Provider.of<List<Movie>>(context);
//                 //   print('bong');
//                 //   print(movies[0]);
//                 //
//                 //
//                 //
//                 //   Movie movie = Movie(moviename: "The Shawshank Redemption", movieposter: "https://www.example.com/shawshank_redemption_poster.jpg", price: 10);
//                 //   print(movie);
//                 //   purchases Purchases = purchases(details: movies,);
//                 //   //purchases Purchases = purchases(details: defDetails);
//                 //   Navigator.push(context, MaterialPageRoute(builder: (context) => Purchases));
//                 // },
//               )
//             ],
//           ),
//         ],
//       ),
//     )
//   );
// }
//
