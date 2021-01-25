import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/models/chat_room_model.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/services/chat_room_service.dart';

part 'chat_room_controller.g.dart';

class ChatRoomController = _ChatRoomController with _$ChatRoomController;

abstract class _ChatRoomController with Store {
  final ChatRoomService chatRoomService = ChatRoomService();
  // ignore: cancel_subscriptions
  StreamSubscription subscription;
  String conversaID;

  @observable
  ObservableList<ChatRoomModel> messagesList;

  @action
  setMessageList(newList) => messagesList = newList;

  void getMessagesFromService() {
    subscription = chatRoomService.getChatByChatID(conversaID).listen((newList) {
      setMessageList(newList.asObservable());
    });
  }


  init(String id) async {
    this.conversaID = id;
    getMessagesFromService();
  }
}
