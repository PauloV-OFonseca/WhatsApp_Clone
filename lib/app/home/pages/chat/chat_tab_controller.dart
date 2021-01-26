import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/chat_model.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';
import 'package:whatsapp_clone/app/shared/services/auth_service.dart';

import 'services/chat_service.dart';
part 'chat_tab_controller.g.dart';

class ChatTabController = _ChatTabControllerBase with _$ChatTabController;

abstract class _ChatTabControllerBase with Store {
  StreamSubscription subscription;
  final authService = AuthService();
  final chatService = ChatService();

  @observable
  ObservableList<ChatModel> chatList = <ChatModel>[].asObservable();

  @observable
  String userUID;

  _ChatTabControllerBase() {
    getUid().then((uid) {
      userUID = uid;
      subscription = chatService
          .getChatListByUID(uid)
          .listen((event) => chatList = event.asObservable());
    });
  }

  Future<String> getUid() async {
    final user = await authService.getCurrentUser();
    return user.uid;
  }

  void cancelSubscription() {
    subscription.cancel();
  }

  navigateToChatRoom(BuildContext context, ChatModel user) {
    Map<String, dynamic> args = {
      "user": user,
      "uid": userUID,
    };
    Navigator.pushNamed(context, AppRoutes.CHATROOM, arguments: args);
  }
}
