import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email;

  @observable
  String password;

  @computed
  isValid() {
    return emailValidator() == null && passwordValidator() == null;
  }

  @action
  changeEmail(newEmail) => email = newEmail;

  @action
  changePassword(newPassword) => password = newPassword;

  String emailValidator() {
    if (!email.contains("@")) return "Esse não é um email válido";
    return null;
  }

  String passwordValidator() {
    if (password.length < 3) return "Senha muito pequena";
    return null;
  }
}
