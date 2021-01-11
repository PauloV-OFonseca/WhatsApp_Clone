import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/intro/pages/login/register/components/register_alert_box.dart';
import 'package:whatsapp_clone/app/shared/services/auth_service.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  RegisterAlertBox alertBox = RegisterAlertBox();
  final AuthService _authService = AuthService();

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
    } else if (password.length < 6) {
      return "Mínimo de 6 caracteres";
    }
    return null;
  }

  createUser(context) async {
    try {
      await _authService.createUser(email, password);
      alertBox.showMyDialog(context);
    } catch (e) {
      print(e);
    }
  }
}
