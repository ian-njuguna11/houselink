import '../models/user.dart';
import '../screens/authenticate/autheticate.dart';
import '../screens/home.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context); 
    // print(user);
    //return home or authenticate
    // return Autheticate();
    // if(user == null){
    //   return Autheticate();
    // } else {
    //   return Home();
    // }

    return user == null ? Autheticate() : Home() ;

  }
}