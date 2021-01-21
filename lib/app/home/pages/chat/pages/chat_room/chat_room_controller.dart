import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/message_model.dart';
import 'package:whatsapp_clone/app/shared/utils/mocks.dart';

part 'chat_room_controller.g.dart';

class ChatRoomController = _ChatRoomController with _$ChatRoomController;

abstract class _ChatRoomController with Store {
  @observable
  ObservableList<MessageModel> messagesList =
      Mocks().getMessages().asObservable();

  _ChatRoomController() {
    messagesList.sort((a, b) => a.horario.compareTo(b.horario));
  }

  @action
  addMessage(String newText, String uid) {
    var newMessage = MessageModel(
      horario: DateTime.now().millisecondsSinceEpoch,
      remetente: uid,
      status: 2,
      texto: newText,
    );
    messagesList.add(newMessage);
  }
}
