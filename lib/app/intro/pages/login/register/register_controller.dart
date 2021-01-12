import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:email_validator/email_validator.dart';
import 'package:whatsapp_clone/app/intro/pages/login/register/components/register_alert_box.dart';
import 'package:whatsapp_clone/app/intro/pages/login/register/models/new_user_model.dart';
import 'package:whatsapp_clone/app/intro/pages/login/register/services/register_auth_service.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  RegisterAuthService registerAuthService = RegisterAuthService();
  RegisterAlertBox alertBox = RegisterAlertBox();
  String messageEmpty = "Preencher Campo";

  @observable
  String name;
  @observable
  String email;
  @observable
  String password;
  @observable
  File image;

  @action
  changeName(String newValue) => name = newValue;
  @action
  changeEmail(String newValue) => email = newValue;
  @action
  changePassword(String newValue) => password = newValue;
  @action
  Future getImage() async {
    final picker = ImagePicker();
    try {
      final imagePicker = await picker.getImage(source: ImageSource.gallery);
      if (imagePicker != null) {
        print(imagePicker.path);
        image = File(imagePicker.path);
      } else {
        print("Sem imagem selecionada");
      }
    } catch (error) {
      print(error);
    }
  }

  @action
  removeImage() => image = null;

  String validateName(name) {
    if (name == null || name.isEmpty) {
      return messageEmpty;
    }

    return null;
  }

  String validateEmail(email) {
    return !EmailValidator.validate(email) ? 'Email inválido' : null;
  }

  String validatePassword(password) {
    if (password == null || password.isEmpty) {
      return messageEmpty;
    } else if (password.length < 6) {
      return "Mínimo de 6 caracteres";
    }
    return null;
  }

  createUser(NewUserModel user, context) async {
    try {
      registerAuthService.signUp(user);
      alertBox.showMyDialog(context);
    } catch (e) {
      print(e);
    }
  }
}
