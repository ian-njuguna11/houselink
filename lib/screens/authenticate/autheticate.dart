import 'package:flutter/material.dart';
import 'package:houselink/screens/authenticate/sign_in.dart';

class Autheticate extends StatefulWidget {
  @override
  _AutheticateState createState() => _AutheticateState();
}

class _AutheticateState extends State<Autheticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
      // child: register(),
      
    );
  }
}