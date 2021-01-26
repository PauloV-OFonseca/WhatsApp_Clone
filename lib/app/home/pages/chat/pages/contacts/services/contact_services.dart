import 'package:firebase_database/firebase_database.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/contacts/models/user_model.dart';

class ContactServices {
  final databaseReference = FirebaseDatabase.instance.reference();

  Stream<List<UserModel>> checkUsersList() {
    return databaseReference.child("usuarios_chat").onValue.map((event) {
      Map<dynamic, dynamic> result = event.snapshot.value;
      List<UserModel> userList = result.entries.map((entry) {
        entry.value["key"] = entry.key;
        return UserModel.fromJson(entry.value);
      }).toList();
      userList.sort((a, b) => _sort(a.nome, b.nome));
      return userList;
    });
  }

  int _sort(String name1, String name2) {
    return name1.toLowerCase().compareTo(name2.toLowerCase());
  }
}
