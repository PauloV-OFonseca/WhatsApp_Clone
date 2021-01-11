import 'package:firebase_auth/firebase_auth.dart';
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
    return emailValidator() == null && passwordValidator() == null;
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
    if (password != null && password.length < 6)
      return "Senha muito pequena";
    else
      return null;
  }

  login(context) async {
    try {
      await _authService.login(email, password);
      navigateToHome(context);
    } catch (error) {
      print(error);
    }
  }

  Future<bool> isUserLogged() async {
    FirebaseUser user = await _authService.getCurrentUser();
    return user != null ? true : false;
  }

  navigateToHome(context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  navigateToRegister(context) {
    Navigator.pushNamed(context, "/register");
  }

  navigateToLogin(context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
}
