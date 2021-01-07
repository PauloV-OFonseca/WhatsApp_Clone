import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  String messageEmpty = "Preencher Campo";

  @observable
  String name;
  @observable
  String email;
  @observable
  String password;

  @computed
  bool get isValid {
    return name != null &&
        email != null &&
        password != null &&
        validateName() == null &&
        validateEmail() == null &&
        validatePassword() == null;
  }

  @action
  changeName(String newValue) => name = newValue;
  @action
  changeEmail(String newValue) => email = newValue;
  @action
  changePassword(String newValue) => password = newValue;

  String validateName() {
    if (name == null || name.isEmpty) {
      return messageEmpty;
    }

    return null;
  }

  String validateEmail() {
    if (email == null || email.isEmpty) {
      return messageEmpty;
    } else if (!email.contains("@")) {
      return "Email inválido";
    }

    return null;
  }

  String validatePassword() {
    if (password == null || password.isEmpty) {
      return messageEmpty;
    } else if (password.length < 4) {
      return "Mínimo de 4 caracteres";
    }
    return null;
  }
}
