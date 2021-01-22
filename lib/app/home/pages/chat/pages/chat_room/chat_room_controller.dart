import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/message_widget.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/models/chat_room_model.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/services/chat_room_service.dart';

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
      if (newList.length > 12) {
        newList = newList.reversed.toList();
      }
      setMessageList(newList.asObservable());
    });
  }

  void cancelSubscription() {
    subscription.cancel();
  }

  init(String id) async {
    this.conversaID = id;
    getMessagesFromService();
  }

  @action
  addMessage(String newText, String uid) async {
    var timeStamp = DateTime.now().millisecondsSinceEpoch;
    var newMessage = ChatRoomModel(
      key: uid.substring(0, 5) + timeStamp.toString(),
      horario: timeStamp,
      remetente: uid,
      status: 2,
      texto: newText,
    );
    if (messagesList.length == 12) {
      messagesList = messagesList.reversed.toList().asObservable();
      messagesList.insert(0, newMessage);
    } else if (messagesList.length > 12) {
      messagesList.insert(0, newMessage);
    } else {
      messagesList.add(newMessage);
    }
    try {
      var response = await chatRoomService.sendMessage(newMessage, conversaID);
      print(response);
    } catch (erro) {
      print(erro);
    }
  }
}
