import 'package:flutter/material.dart';
import 'package:whatsapp_clone/splash_screen.dart';
import 'package:whatsapp_clone/utils/RouteGenerator.dart';

void main() {
  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF4CAF50)
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenetor.generateRoute,
    );
  }
}