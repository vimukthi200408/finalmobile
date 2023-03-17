import 'package:finalmobile/services/firebaseauth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  Signin({Key? key}) : super(key: key);



  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {


  FireBaseAuth spider = FireBaseAuth();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:Text("Sigh in to Movies Application",style:TextStyle(color: Colors.blue) ,),
      ),
      body:Container(
        padding:EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child:ElevatedButton(
          onPressed: () async{
            dynamic result = await spider.anonSign();
            if (result ==null){
              print("error signing in ");
            }else{
              print("signed in ");
              print(result);
            }
          },
          child: Text("Sign in anon")
        ),
      ),

    );
  }
}
