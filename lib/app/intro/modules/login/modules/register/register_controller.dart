import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_clone/app/intro/modules/login/modules/register/components/register_alert_box.dart';
import 'package:whatsapp_clone/app/intro/modules/login/modules/register/models/new_user_model.dart';
import 'package:whatsapp_clone/app/intro/modules/login/modules/register/services/register_auth_service.dart';
import 'package:whatsapp_clone/app/intro/modules/login/modules/register/services/storage_service.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterAuthService registerAuthService;
  RegisterAlertBox alertBox = RegisterAlertBox();
  final StorageService storageService;
  String messageEmpty = "Preencher Campo";

  _RegisterControllerBase(this.registerAuthService, this.storageService);

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
    try {
      final imagePicker =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (imagePicker != null) image = File(imagePicker.path);
    } catch (error) {
      print(error);
    }
  }

  @action
  removeImage() => image = null;

  @action
  Future<String> getImageUrl() async {
    if (image != null) {
      return storageService.uploadImage(image);
    } else
      return "";
  }

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
      alertBox.showMyDialog(context, true);
      var imageUrl = await getImageUrl();
      user.dados.foto = imageUrl;
      await registerAuthService.signUp(user);
      alertBox.showMyDialog(context, false);
    } catch (e) {
      print(e);
    }
  }
}
