import 'package:finalmobile/register.dart';
import 'package:finalmobile/signin.dart';
import 'package:flutter/material.dart';

class Validate extends StatefulWidget {
  const Validate({Key? key}) : super(key: key);

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {

  bool register = false;
  void switchPage(){
    setState(() {
      if (register) {
        register = false;
      } else {
        register = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    if (register){
      return Register(switchPage: switchPage);
    }else{
      return Signin(switchPage: switchPage);
    }

    // return Container(
    //   child:Register(),
    // );
  }
}
