import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/intro/pages/login/login_controller.dart';

class LoginBody extends StatelessWidget {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    print(controller.isValid);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
          child: Observer(
            builder: (_) {
              return TextFormField(
                onChanged: controller.changeEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) {
              return TextFormField(
                onChanged: controller.changePassword,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
              );
            },
          ),
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
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
