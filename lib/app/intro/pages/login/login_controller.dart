import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/shared/services/auth_service.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthService _authService = AuthService();

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

  @action
  login(context) async {
    try {
      await _authService.login(email, password);
      navigateToHome(context);
    } catch (e) {
      print("ALOALO");
      print(e);
    }
  }

  navigateToHome(context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  navigateToRegister(context) {
    Navigator.pushNamed(context, "/register");
  }
}
