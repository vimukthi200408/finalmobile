import 'dart:ui';

import 'package:finalmobile/services/firebaseauth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  //Signin({Key? key}) : super(key: key);

  final Function switchPage;
  Signin({required this.switchPage});



  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {


  FireBaseAuth spider = FireBaseAuth();
  final _formKey = GlobalKey<FormState>();

  String username='';
  String password= '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Image.asset('assets/batman.jpg',fit: BoxFit.cover,),
            ),

          ),
          Center(
            child: Form(
              key:_formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Sign in',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 400,
                    child:TextFormField(
                      validator: (input) => input!.isEmpty ? 'Enter a email' :null,
                      onChanged: (input){
                          setState(() => username = input);
                      },
                      decoration: InputDecoration(
                        hintText: 'username',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      obscureText: true,
                      validator: (input) => input!.length < 5 ? 'Enter a password longer than 5 character' :null,
                      onChanged: (input){
                        setState(() => password = input);
                      },
                      decoration: InputDecoration(
                        hintText: 'password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    child:Text('Sign in'),
                    onPressed: () async{
                      if (_formKey.currentState!.validate()){
                         await spider.Signingin(username, password);
                      }
                    },
                  ),
                  SizedBox(height: 120),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // sets background color to transparent
                      onPrimary: Colors.black, // se
                    ),
                    child:Text('Do not have a account ?  Register here',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline, // underlines the text
                      ),
                    ),
                    onPressed: () {
                      widget.switchPage();
                    },
                  ),


                ],
              ),


          ),

          ),
        ],
      ),
    );

  }
}