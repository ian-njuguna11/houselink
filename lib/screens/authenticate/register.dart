import 'package:houselink/screens/authenticate/sign_in.dart';
import 'package:houselink/screens/home.dart';

import '../../services/auth.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  
  final AuthService _auth= AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String _email = '';
  String _pswd = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
      // loading ? Loading() :
    return Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[400],
          title: Text('Sign up into House Link'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () => Navigator.of(context).pushNamed('/signin'),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email',),
                  validator: (val) => val.isEmpty ? 'Enter an email': null,
                  onChanged: (val){
                    setState(() => _email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password',),
                  validator: (val) => val.length < 6 ? 'Enter a password that is 6+ char long': null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() => _pswd = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () async {
                    // return _formKey.currentState.validate() ? (){
                    //   debugPrint(_email);
                    //   debugPrint(_pswd);
                    // }: print('null');
                    if(_formKey.currentState.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.regWithEmailAndPswd(_email, _pswd);
                      if(result == null){
                        setState(() {
                          error = 'Please Suply a valid email'; 
                          loading  = false;
                        });
                      }
                    }
                  },
                ),
                SizedBox(height:12),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 14.0)
                )

              ],
            ),
          ),
        ),
    );
  }
}