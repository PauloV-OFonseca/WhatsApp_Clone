import 'package:firebase_database/firebase_database.dart';
import 'package:whatsapp_clone/app/modules/home/pages/chat/models/chat_model.dart';
import 'package:whatsapp_clone/app/shared/consts/firebase.dart';

class ChatService {
  final databaseReference = FirebaseDatabase.instance.reference();

  Stream<List<ChatModel>> getChatListByUID(String id) {
    return databaseReference
        .child('${DatabasePath.USUARIOS_CONVERSA_CHAT}$id')
        .onValue
        .map((event) {
      Map<dynamic, dynamic> result = event.snapshot.value;
      return result.entries.map(_jsonToChatModel).toList();
    });
  }

  ChatModel _jsonToChatModel(MapEntry<dynamic, dynamic> json) {
    json.value['remetente_id'] = json.key;
    return ChatModel.fromJson(json.value);
  }
}
