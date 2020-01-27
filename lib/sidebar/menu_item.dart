import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {

  final IconData icon;
  final String title;
  final Function ontap;

  const MenuItem({Key key, this.icon, this.title, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child:Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.cyan, size: 30),
          SizedBox(width: 20,),
          Text(title, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),

        ],
      ),
    ),
    );
  }
}