import 'package:batterylevel/screens/Home.dart';
//import 'package:batterylevel/screens/PhoneLogin.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        //accentColor: Colors.cyan[600],

        fontFamily: 'Montserrat',

        // Access Color -  Theme.of(context).primaryColor
        // Access Text  -  Theme.of(context).textTheme.

        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
          headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,color: Colors.black),
          subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
          bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          button: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),

        ),
      ),
      home: Home(),
    );
  }
}
