import 'package:flutter/material.dart';
import 'package:whatsapp_clone/home.dart';

class RouteGenetor {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case "/":
        return MaterialPageRoute(
          builder: (_) => Home()
        );
      case "/home":
        return MaterialPageRoute(
          builder: (_) => Home()
        );
    }
  
  }

}