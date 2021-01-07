import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/intro/pages/login/login_controller.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    print(controller.isValid);
    return SingleChildScrollView(
      child: Column(
        children: [
          LoginForm(
            title: "Email",
            onChanged: controller.changeEmail,
            errorText: controller.emailValidator,
          ),
          LoginForm(
            title: "Senha",
            onChanged: controller.changePassword,
            errorText: controller.passwordValidator,
          ),
          Observer(
            builder: (_) {
              return RaisedButton(
                onPressed: controller.isValid ? () {} : null,
                child: Text("Login"),
              );
            },
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/register");
            },
            child: Text("Cadastrar"),
          )
        ],
      ),
    );
  }
}
