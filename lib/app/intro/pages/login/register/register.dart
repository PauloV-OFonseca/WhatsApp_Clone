import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'components/register_form.dart';
import 'register_controller.dart';

class Register extends StatelessWidget {
  final controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro")
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterForm(
              title: "Nome",
              onChanged: controller.changeName,
              errorText: controller.validateName,
              isPassword: false,
            ),
            RegisterForm(
              title: "Email",
              onChanged: controller.changeEmail,
              errorText: controller.validateEmail,
              isPassword: false,
            ),
            RegisterForm(
              title: "Senha",
              onChanged: controller.changePassword,
              errorText: controller.validatePassword,
              isPassword: true,
            ),
            Observer(
              builder: (_) {
                return RaisedButton(
                  onPressed: controller.isValid
                      ? () {
                          controller.createUser(context);
                        }
                      : null,
                  child: Text("Cadastrar"),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}
