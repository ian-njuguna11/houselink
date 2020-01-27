import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class bottom_nav extends StatefulWidget {
  @override
  _bottom_navState createState() => _bottom_navState();
}

class _bottom_navState extends State<bottom_nav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepOrange,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.black26,
        height: 45,
        index: 2,
        items: <Widget>[
          Icon(Icons.hotel,size: 25,color: Color(0xFF1BB5FD),),
          Icon(Icons.home,size: 25,color: Color(0xFF1BB5FD)),
          Icon(Icons.list,size: 25,color: Color(0xFF1BB5FD)),
          Icon(Icons.add_call ,size: 25,color: Color(0xFF1BB5FD)),
          Icon(Icons.directions_car,size: 25,color: Color(0xFF1BB5FD)),
        ],
        animationDuration: Duration(
          milliseconds: 50
        ),
        animationCurve: Curves.elasticInOut,
      ),
    );
  }
}