import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/intro/pages/login/register/models/new_user_model.dart';
import 'components/profile_image.dart';
import 'components/register_form.dart';
import 'register_controller.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controller = RegisterController();

  var user = NewUserModel(dados: Dados());

  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _validate() {
      if (_registerFormKey.currentState.validate()) {
        _registerFormKey.currentState.save();
        controller.createUser(user, context);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro")),
      body: SingleChildScrollView(child: Observer(builder: (_) {
        return Column(
          children: [
            Form(
              key: _registerFormKey,
              child: Column(
                children: [
                  Text("Selecione uma imagem"),
                  ProfileImage(
                    image: controller.image,
                    getImage: controller.getImage,
                    removeImage: controller.removeImage,
                  ),
                  RegisterForm(
                    title: "Nome",
                    onChanged: controller.changeName,
                    onSaved: (input) => user.dados.nome = input,
                    validator: controller.validateName,
                    isPassword: false,
                  ),
                  RegisterForm(
                    title: "Email",
                    onChanged: controller.changeEmail,
                    onSaved: (input) => user.dados.email = input,
                    validator: controller.validateEmail,
                    isPassword: false,
                  ),
                  RegisterForm(
                    title: "Senha",
                    onChanged: controller.changePassword,
                    onSaved: (input) => user.senha = input,
                    validator: controller.validatePassword,
                    isPassword: true,
                  )
                ],
              ),
            ),
            controller.isLoading
                ? CircularProgressIndicator()
                : RaisedButton(
                    onPressed: () {
                      _validate();
                    },
                    child: Text("Cadastrar"),
                  )
          ],
        );
      })),
    );
  }
}
