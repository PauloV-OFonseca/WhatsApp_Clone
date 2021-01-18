import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/chat_model.dart';
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

  _ChatTabControllerBase() {
    getUid().then((uid) {
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
}
