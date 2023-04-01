import 'package:finalmobile/homePage.dart';
import 'package:finalmobile/main.dart';
import 'package:finalmobile/models/user.dart';
import 'package:finalmobile/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Bser>(context);

    print("sp1");
    print(user.uid);
    print("sp2");

    // if (user == null){
    //   print("goesin");
    // }else{
    //   print("j");
    // }


    //return Validate();

    //return home or validate
    if (user.uid =='risk'){
      return Validate();
    }else{
      return MyHomePage();
    }

    
  }
}
