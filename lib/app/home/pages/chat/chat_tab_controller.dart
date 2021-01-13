import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/chat_model.dart';
part 'chat_tab_controller.g.dart';

class ChatTabController = _ChatTabControllerBase with _$ChatTabController;

abstract class _ChatTabControllerBase with Store {
  _ChatTabControllerBase() {
    getChatList();
  }
  @observable
  ObservableList<ChatModel> chatList;

  @action
  getChatList() {
    chatList = [
      ChatModel(
        foto:
            "https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-2-1.jpeg",
        id: "id1",
        silenciado: true,
        titulo: "Paulo",
        visualizado: true,
        mensagensNaoLidas: 10,
        ultimaMensagem: UltimaMensagem(
            horario: "11:48", remetente: "Joao", texto: "flutter é top"),
      ),
      ChatModel(
        foto:
            "https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-2-1.jpeg",
        id: "id1",
        silenciado: false,
        titulo: "Paulo2",
        visualizado: true,
        mensagensNaoLidas: 5,
        ultimaMensagem: UltimaMensagem(
            horario: "11:48", remetente: "Joao", texto: "flutter é top"),
      ),
      ChatModel(
        foto:
            "https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-2-1.jpeg",
        id: "id1",
        silenciado: true,
        titulo: "Paulo3",
        visualizado: true,
        mensagensNaoLidas: 0,
        ultimaMensagem: UltimaMensagem(
            horario: "11:48", remetente: "Joao", texto: "flutter é top"),
      )
    ].asObservable();
  }
}
