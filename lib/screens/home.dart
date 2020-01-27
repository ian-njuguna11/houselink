import 'package:flutter/material.dart';
import 'package:houselink/services/auth.dart';
import 'package:houselink/sidebar/sidebar_layout.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: SideBarLayout(),
    );
  }
}