import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/modules/home/pages/chat/pages/chat_room/services/chat_room_service.dart';

import 'models/chat_room_model.dart';

part 'chat_room_controller.g.dart';

class ChatRoomController = _ChatRoomController with _$ChatRoomController;

abstract class _ChatRoomController with Store {
  final ChatRoomService chatRoomService = ChatRoomService();
  StreamSubscription subscription;
  @observable
  String conversaID;

  @observable
  ObservableList<ChatRoomModel> messagesList;

  @action
  setMessageList(newList) => messagesList = newList;

  void getMessagesFromService() {
    subscription =
        chatRoomService.getChatByChatID(conversaID).listen((newList) {
      if (newList.length > 12) newList = newList.reversed.toList();

      setMessageList(newList.asObservable());
    });
  }

  void dispose() {
    cancelSubscription();
  }

  init(String id) async {
    this.conversaID = id;
    getMessagesFromService();
  }

  @action
  addMessage(ChatRoomModel newMessage) {
    if (messagesList.length == 12) {
      messagesList = messagesList.reversed.toList().asObservable();
      messagesList.insert(0, newMessage);
    } else if (messagesList.length > 12)
      messagesList.insert(0, newMessage);
    else
      messagesList.add(newMessage);
  }

  sendMessage(String newText, String uid) async {
    final timeStamp = DateTime.now().millisecondsSinceEpoch;
    final newMessage = ChatRoomModel(
      key: uid.substring(0, 5) + timeStamp.toString(),
      horario: timeStamp,
      remetente: uid,
      status: 2,
      texto: newText,
    );

    addMessage(newMessage);

    try {
      final response =
          await chatRoomService.sendMessage(newMessage, conversaID);
      print(response);
    } catch (erro) {
      print(erro);
    }
  }

  void cancelSubscription() {
    subscription.cancel();
  }
}
