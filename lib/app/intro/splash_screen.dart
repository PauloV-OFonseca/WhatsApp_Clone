import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/intro/pages/login/login_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = LoginController();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      await controller.isUserLogged()
          ? controller.navigateToLogin(context)
          : controller.navigateToHome(context);
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
                  child: Image.asset(
                    "assets/WhatsApp.png",
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
