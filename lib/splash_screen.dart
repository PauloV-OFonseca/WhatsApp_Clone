import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    
  @override
  void initState(){
    super.initState();
    Timer(
        Duration(seconds: 3),
        () {
          Navigator.pushReplacementNamed(context, "/home");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("assets/WhatsApp.png", 
                    width: 150, 
                    height: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}