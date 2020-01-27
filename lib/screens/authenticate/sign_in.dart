import '../../services/auth.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String error = ''; 

  final AuthService _auth = AuthService();

  bool loading = false;

  String _email = '';
  String _pswd = '';

  // final _auth = 
  @override
  Widget build(BuildContext context) {
    // loading ? Loading() :
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[400],
          title: Text('Sign in to House Link'),
          actions: <Widget>[
            FlatButton.icon(
                  icon: Icon(Icons.person_add) ,
                  label: Text('Register Here'),
                  onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                  },
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
                  validator: (val) => val.length < 6 ? 'Enter a passwordd that is 6+ char long':null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() => _pswd = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text('Sign In'),
                  onPressed: () async {
                   if(_formKey.currentState.validate()){
                     setState(() {
                       loading = true;
                     });
                    dynamic result = await _auth.signInWithEmailAndPswd(_email, _pswd);
                    if(result == null){
                      setState(() {
                        error = 'could not sign with those credentials';
                        loading = false;
                      });
                    }
                   }
                  },
                ),
                // SizedBox(height: 20.0),
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