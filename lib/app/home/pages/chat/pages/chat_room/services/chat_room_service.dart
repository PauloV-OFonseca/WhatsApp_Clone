import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/models/chat_room_model.dart';

class ChatRoomService {
  final databaseReference = FirebaseDatabase.instance.reference();
  final dio = Dio();

  Stream<List<ChatRoomModel>> getChatByChatID(String id) {
    return databaseReference
        .child('conversas_chat/$id')
        .limitToLast(20)
        .onValue
        .map((event) {
      Map<dynamic, dynamic> result = event.snapshot.value;
      if (result == null) {
        return <ChatRoomModel>[];
      }
      return result.entries.map(_jsonToChatRoomModel).toList()..sort(_sortList);
    });
  }

  int _sortList(ChatRoomModel a, ChatRoomModel b) =>
      a.horario.compareTo(b.horario);

  ChatRoomModel _jsonToChatRoomModel(MapEntry<dynamic, dynamic> json) {
    return ChatRoomModel.fromJson(json.value);
  }

  Future<Response> sendMessage(ChatRoomModel message, String conversaID) {
    var url =
        'https://estagio-clima.firebaseio.com/conversas_chat/$conversaID/${message.key}.json';

    return dio.put(url, data: chatRoomModelToJson(message));
  }
}
