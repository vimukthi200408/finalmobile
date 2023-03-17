import 'package:finalmobile/homePage.dart';
import 'package:finalmobile/main.dart';
import 'package:finalmobile/validate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //return home or validate
    return Validate();
    
  }
}
