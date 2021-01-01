import 'package:flutter/material.dart';
import 'package:whatsapp_clone/home.dart';
import 'package:whatsapp_clone/screens/chat_room.dart';
import 'package:whatsapp_clone/screens/detail_user.dart';
import 'package:whatsapp_clone/tabs/contacts_tab.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch(settings.name){
      case "/":
        return MaterialPageRoute(
          builder: (_) => Home()
        );
      case "/home":
        return MaterialPageRoute(
          builder: (_) => Home()
        );
      case "/contacts":
        return MaterialPageRoute(
          builder: (_) => ContactsTab()
        );
      case "/chatroom":
        return MaterialPageRoute(
          builder: (_) => ChatRoom(args)
        );
      case "/detailuser":
        return MaterialPageRoute(
          builder: (_) => DetailUser(args)
        );
    }
  
  }

}