import 'dart:async';
import './Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var count = 0;
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Home()));
    });
    return Scaffold(
      body: Center(
        child: 
            Image.asset(
                      "assets/images/animat-checkmark.gif",
                      height: 125.0,
                      width: 125.0,
                    ),
      ),
    );
  }
}