import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';

class MyAccountsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(child:bottom_nav(),
              ),
            ],
          ),
        ),
      ),


    );
  }
}