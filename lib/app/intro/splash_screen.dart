import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';
import 'package:whatsapp_clone/app/shared/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authService = Modular.get<AuthService>();
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      await authService.getCurrentUser() == null
          ? Modular.to.pushNamed(AppRoutes.LOGIN)
          : Modular.to.pushNamed(AppRoutes.HOME);
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
