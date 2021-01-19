import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/chat_model.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/message_model.dart';
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

  @observable
  ObservableList<MessageModel> messagesList = [
    MessageModel(
        texto: "Olá, tudo bem?",
        horario: 1588700170343,
        remetente: "KzjHJORIt7OFaaGCVG30jJHYsbP2",
        status: 2),
    MessageModel(
        texto: "Tudo bem e com vc?",
        horario: 1588700170343,
        remetente: "zjHJORIt7OFaaGCVG30jJHYsbP2",
        status: 2),
    MessageModel(
        texto: "Flutter é top",
        horario: 1588700170343,
        remetente: "zjHJORIt7OFaaGCVG30jJHYsbP2",
        status: 2),
    MessageModel(
        texto: "Verdade!!!! MUITO TOP",
        horario: 1588700170343,
        remetente: "KzjHJORIt7OFaaGCVG30jJHYsbP2",
        status: 2),
  ].asObservable();

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
}
