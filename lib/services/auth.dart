import '../models/user.dart';
import '../screens/authenticate/register.dart';
import '../screens/authenticate/sign_in.dart';
import '../screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj on firebaseUser
  User _userFromFireBaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }

    //auth chenge user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    // .map((FirebaseUser user) => _userFromFireBaseUser(user));
    .map(_userFromFireBaseUser);
  }

  //sign in anon
  Future SignInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in with email & password
  Future signInWithEmailAndPswd(String _email, String _pswd) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: _email,password: _pswd);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }
  //register with email & password
  Future regWithEmailAndPswd(String _email, String _pswd) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: _email,password: _pswd);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
      // return SignIn();
    }catch(e){
      print(e.toString());
    }
  }

  //sign out
  Future SignOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
    }
  }
}