import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/shared/consts/app_colors.dart';
import 'package:whatsapp_clone/app/shared/utils/route_generator.dart';
import 'intro/splash_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
          primaryColor: AppColors.PRIMARY_COLOR,
          accentColor: AppColors.ACCENT_COLOR),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
