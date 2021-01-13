import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  Future<String> uploadImage(File image) async {
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child("img/usuarios");
    var fileName = new DateTime.now().millisecondsSinceEpoch.toString();
    final uploadTask = firebaseStorageRef.child("$fileName.jpg").putFile(image);
    return uploadTask.onComplete
        .then((task) => task.ref.getDownloadURL())
        .then((url) => url.toString());
  }
}
