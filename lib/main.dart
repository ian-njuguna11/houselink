import './sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './models/user.dart';
import './screens/authenticate/register.dart';
import './screens/authenticate/sign_in.dart';
import './screens/wrapper.dart';
import './services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
//      DeviceOrientation.portraitDown,
    ]);
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white
        ),
        home: wrapper(), 
        // SideBarLayout()
        routes: {
          '/register': (context) => register(),
          '/signin': (context) => SignIn()
        },
      ),
    );
  }
}


// import './sidebar/sidebar_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
// //      DeviceOrientation.portraitDown,
//     ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         primaryColor: Colors.white
//       ),
//       home: SideBarLayout()
//     );
//   }
// }