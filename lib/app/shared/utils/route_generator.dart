import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/home/home.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/chat_room.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/pages/detail_user.dart';
import 'package:whatsapp_clone/app/home/pages/status/pages/status_room.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/contacts_tab.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Home());
      case "/home":
        return MaterialPageRoute(builder: (_) => Home());
      case "/contacts":
        return MaterialPageRoute(builder: (_) => ContactsTab());
      case "/chatroom":
        return MaterialPageRoute(builder: (_) => ChatRoom(args));
      case "/detailuser":
        return MaterialPageRoute(builder: (_) => DetailUser(args));
      case "/statusroom":
        return MaterialPageRoute(builder: (_) => StatusRoom(args));
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
