import 'package:flutter/material.dart';
import 'package:whatsapp_clone/splash_screen.dart';
import 'package:whatsapp_clone/utils/route_generator.dart';
import 'consts/app_colors.dart';

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
        primaryColor: AppColors.PRIMARY_COLOR,
        accentColor: AppColors.ACCENT_COLOR
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}