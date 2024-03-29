import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/home/home.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/chat_room.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/pages/detail_user.dart';
import 'package:whatsapp_clone/app/home/pages/status/pages/status_room.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/contacts/contacts_tab.dart';
import 'package:whatsapp_clone/app/intro/pages/login/login.dart';
import 'package:whatsapp_clone/app/intro/pages/login/register/register.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.INTRO:
        return MaterialPageRoute(builder: (_) => Home());
      case AppRoutes.HOME:
        return MaterialPageRoute(builder: (_) => Home());
        case AppRoutes.LOGIN:
        return MaterialPageRoute(builder: (_) => Login());
      case AppRoutes.REGISTER:
        return MaterialPageRoute(builder: (_) => Register());
      case AppRoutes.CONTACTS:
        return MaterialPageRoute(builder: (_) => ContactsTab());
      case AppRoutes.CHATROOM:
        return MaterialPageRoute(builder: (_) => ChatRoom(args));
      case AppRoutes.DETAILUSER:
        return MaterialPageRoute(builder: (_) => DetailUser(args));
      case AppRoutes.STATUSROOM:
        return MaterialPageRoute(builder: (_) => StatusRoom(args));
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
