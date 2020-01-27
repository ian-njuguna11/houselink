import 'package:houselink/services/auth.dart';

import '../bottom_nav/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class HomePage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {

    final  _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        // title: Text('Home',),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              return await _auth.SignOut();              
            },
          )
        ],
        elevation: 0.1,
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