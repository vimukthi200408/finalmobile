import 'dart:ui';

import 'package:finalmobile/services/firebaseauth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
 // const Register({Key? key}) : super(key: key);



  final Function switchPage;
  Register({required this.switchPage});




  @override
  State<Register> createState() => _RegisterState();


}




class _RegisterState extends State<Register> {
  @override

  FireBaseAuth spider = FireBaseAuth();
  final _formKey = GlobalKey<FormState>();

  String username='';
  String password= '';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Image.asset('assets/starwars.jpg',fit: BoxFit.cover,),
            ),

          ),
          Center(
            child: Form(
              key:_formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Sign Up',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
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
                    child:Text(
                      'Register',

                    ),
                    onPressed: () async{
                      if (_formKey.currentState!.validate()){
                        dynamic result = await spider.Registering(username, password);
                        if (result == null){
                          //a error message to show when email is not entered correctly
                        }
                        print(username);
                        print(password);
                      }
                    },
                  ),
                  SizedBox(height: 120),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // sets background color to transparent
                      onPrimary: Colors.black, // se
                    ),
                    child:Text('Already have a account ?  Sign in here',
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
