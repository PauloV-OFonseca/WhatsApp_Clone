import 'package:firebase_database/firebase_database.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/models/chat_room_model.dart';

class ChatRoomService {
  final databaseReference = FirebaseDatabase.instance.reference();

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
}
