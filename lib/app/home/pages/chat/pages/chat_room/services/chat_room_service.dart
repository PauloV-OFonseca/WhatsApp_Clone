import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/models/chat_room_model.dart';
import 'package:whatsapp_clone/app/shared/consts/app_api.dart';

class ChatRoomService {
  final databaseReference = FirebaseDatabase.instance.reference();
  final dio = Dio(BaseOptions(baseUrl: AppApi.API_BASE_URL));

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

  ChatRoomModel _jsonToChatRoomModel(MapEntry<dynamic, dynamic> json) =>
      ChatRoomModel.fromJson(json.value);

  Future<Response> sendMessage(ChatRoomModel message, String conversaID) {
    final path = AppApi.CONVERSAS_CHAT
        .replaceAll("{conversaID}", conversaID)
        .replaceAll("{message.key}", message.key);

    return dio.put(path, data: chatRoomModelToJson(message));
  }
}
