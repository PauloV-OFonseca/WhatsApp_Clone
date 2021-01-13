import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/shared/utils/mocks.dart';
part 'chat_tab_controller.g.dart';

class ChatTabController = _ChatTabControllerBase with _$ChatTabController;

abstract class _ChatTabControllerBase with Store {
  _ChatTabControllerBase() {
    getChatList();
  }
  @observable
  ObservableList chatList;

  @action
  getChatList() {
    chatList = Mocks().getUsers().asObservable();
  }
}
