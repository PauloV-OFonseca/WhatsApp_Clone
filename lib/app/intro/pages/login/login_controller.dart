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

  @observable
  bool isLoading = false;

  @observable
  String errorMessage;

  @computed
  bool get isValid {
    return emailValidator(email) == null && passwordValidator(password) == null;
  }

  @action
  changeEmail(newEmail) => email = newEmail;

  @action
  changePassword(newPassword) => password = newPassword;

  @action
  changeLoading(newLoading) => isLoading = newLoading;

  @action
  changeErrorMessage(newErrorMessage) => errorMessage = newErrorMessage;

  String emailValidator(value) {
    if (value != null && !value.contains("@"))
      return "Esse não é um email válido";
    else
      return null;
  }

  String passwordValidator(value) {
    if (value != null && value.length < 6)
      return "Senha muito pequena";
    else
      return null;
  }

  login(context) async {
    try {
      changeLoading(true);
      await _authService.login(email, password);
      navigateToHome(context);
    } catch (error) {
      print(error.code);
      checkError(error.code);
      changeLoading(false);
    }
  }

  checkError(String error) {
    switch (error) {
      case 'ERROR_INVALID_EMAIL':
        {
          changeErrorMessage('Email inválido.');
        }
        break;
      case 'ERROR_USER_NOT_FOUND':
        {
          changeErrorMessage('Usúario não encontrado.');
        }
        break;
      case 'ERROR_WRONG_PASSWORD':
        {
          changeErrorMessage('Senha inválida.');
        }
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        {
          changeErrorMessage('Muitas tentativas de login sem sucesso.');
        }
        break;
      default:
        {
          changeErrorMessage('Erro');
        }
        break;
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
