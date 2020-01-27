import '../pages/HomePage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import '../pages/myaccountpage.dart';
import '../pages/myorders.dart';

enum NavigationEvents{
  HomePageClickedEvent,
  MyAccountClickedEvents,
  MyOrdersClickedEvents,
}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  @override
  
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch(event){
      case NavigationEvents.HomePageClickedEvent: yield HomePage();
      break;
      case NavigationEvents.MyAccountClickedEvents: yield MyAccountsPage();
      break;
      case NavigationEvents.MyOrdersClickedEvents: yield MyOrdersPage();
      break;
    }
   }
}