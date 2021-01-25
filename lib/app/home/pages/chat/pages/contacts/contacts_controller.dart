import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/contacts/services/contact_services.dart';

import 'models/user_model.dart';
part 'contacts_controller.g.dart';

class ContactsController = _ContactsController with _$ContactsController;

abstract class _ContactsController with Store {
  final ContactServices contactServices = ContactServices();
  StreamSubscription subscription;

  @observable
  ObservableList<UserModel> userList = <UserModel>[].asObservable();

  @computed
  bool get isLoading => userList.isEmpty && userList != null;

  _ContactsController() {
    subscription = contactServices.checkUsersList().listen((event) {
      userList = event.asObservable();
    });
  }

  void cancelSubscription() {
    subscription.cancel();
  }
}
