import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'components/register_form.dart';
import 'register_controller.dart';

class Register extends StatelessWidget {
  final controller = RegisterController();
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cadastro")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    RegisterForm(
                      title: "Nome",
                      onChanged: controller.changeName,
                      validator: controller.validateName,
                      isPassword: false,
                    ),
                    RegisterForm(
                      title: "Email",
                      onChanged: controller.changeEmail,
                      validator: controller.validateEmail,
                      isPassword: false,
                    ),
                    RegisterForm(
                      title: "Senha",
                      onChanged: controller.changePassword,
                      validator: controller.validatePassword,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  return RaisedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState.validate())
                        controller.createUser(context);
                    },
                    child: Text("Cadastrar"),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
