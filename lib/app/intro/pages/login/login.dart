import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/intro/pages/login/login_controller.dart';

import 'components/login_form.dart';

class Login extends StatelessWidget {
  final controller = LoginController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  LoginForm(
                    title: "Email",
                    onChanged: controller.changeEmail,
                    validator: controller.emailValidator,
                    isPassword: false,
                  ),
                  LoginForm(
                    title: "Senha",
                    onChanged: controller.changePassword,
                    validator: controller.passwordValidator,
                    isPassword: true,
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                return RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      controller.login(context);
                    }
                  },
                  child: Text("Login"),
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                controller.navigateToRegister(context);
              },
              child: Text("Cadastrar"),
            )
          ],
        ),
      ),
    );
  }
}
