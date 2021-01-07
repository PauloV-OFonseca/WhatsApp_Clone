import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email;

  @observable
  String password;

  @computed
  bool get isValid {
    return email != null &&
        password != null &&
        emailValidator() == null &&
        passwordValidator() == null;
  }

  @action
  changeEmail(newEmail) => email = newEmail;

  @action
  changePassword(newPassword) => password = newPassword;

  String emailValidator() {
    if (email != null && !email.contains("@"))
      return "Esse não é um email válido";
    else
      return null;
  }

  String passwordValidator() {
    if (password != null && password.length < 3)
      return "Senha muito pequena";
    else
      return null;
  }
}
