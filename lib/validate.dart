import 'package:finalmobile/signin.dart';
import 'package:flutter/material.dart';

class Validate extends StatefulWidget {
  const Validate({Key? key}) : super(key: key);

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Signin(),
    );
  }
}
