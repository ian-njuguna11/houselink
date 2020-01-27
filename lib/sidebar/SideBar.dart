import 'dart:async';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'Custom_menu_Clipper.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOPenedSink;
  // final bool isSideBarOpened = false;
  final _animatedDuration = const Duration(milliseconds: 500);

 @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: _animatedDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOPenedSink = isSideBarOpenedStreamController.sink;
  }
  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOPenedSink.close();
    super.dispose();
  }
  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationComplete = animationStatus == AnimationStatus.completed;

    if(isAnimationComplete){
      isSideBarOPenedSink.add(false);
      _animationController.reverse();
    }else{
      isSideBarOPenedSink.add(true);
      _animationController.forward();
    }
  }
  @override
  Widget build(BuildContext context) {
    final  screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData:  false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOPenedAsync){
          return AnimatedPositioned(
            duration: _animatedDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOPenedAsync.data ? 0 : -screenWidth,
            right: isSideBarOPenedAsync.data ? 0 : screenWidth-42,
            child:Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.deepOrange,
                    child: ListView(
                        children: <Widget>[
                          SizedBox(height: 40,),
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            title: Text('Ian Njuguna',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w600 ),),
                            subtitle: Text("njugunaayan@gmail.com",style: TextStyle(color: Color(0xFF1BB5FD),fontSize: 15, ),),
                            leading: CircleAvatar(child: Icon(Icons.perm_identity,color: Colors.white),radius: 40,),
                          ),
                          Divider(
                              indent: 32,
                              endIndent: 32,
                              color: Colors.white.withOpacity(0.8)
                          ),
                          MenuItem(
                              icon: Icons.home,
                              title: 'Home',
                              ontap: () {
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                              }
                          ),
                          MenuItem(
                              icon: Icons.local_hotel,
                              title: 'Accomodation',
                              ontap: () {
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvents);
                              }
                          ),
                          MenuItem(
                              icon: Icons.landscape,
                              title: 'Land',
                              ontap: () {
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                              }
                          ),
                          Divider(
                              indent: 32,
                              endIndent: 32,
                              color: Colors.white.withOpacity(0.8)
                          ),
                          MenuItem(
                              icon: Icons.person,
                              title: 'My Account',
                              ontap: () {
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvents);
                              }
                          ),
                          MenuItem(
                            icon: Icons.shopping_basket,
                            title: 'My Orders',
                            ontap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvents);
                            },
                          ),
                          Divider(
                              indent: 32,
                              endIndent: 32,
                              color: Colors.white.withOpacity(0.8)
                          ),
                          MenuItem(
                            icon: Icons.settings,
                            title: 'Settings',
                          ),
                          MenuItem(
                            icon: Icons.exit_to_app,
                            title: 'Logout',
                          ),
                        ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0,-0.95),
                  child: GestureDetector(
                    onTap: () => onIconPressed(),
                   child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child:Container(
                      height: 110,
                      width: 35,
                      color: Colors.deepOrange,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: Color(0xFF1BB5FD),
                      size: 25,
                  ),
                )),
                   ),
                 )
              ],
            )
          );
        },
      );  
    }
  }