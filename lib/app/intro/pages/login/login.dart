import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:whatsapp_clone/app/intro/pages/login/components/error_pop_up.dart';
import 'package:whatsapp_clone/app/intro/pages/login/login_controller.dart';

import 'components/login_form.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = LoginController();

  final _formKey = GlobalKey<FormState>();

  ReactionDisposer reactionDisposer;

  @override
  void initState() {
    super.initState();
    reactionDisposer = reaction((_) => controller.errorMessage, (errorMessage) {
      if (errorMessage != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorPopUp(
              errorMessage: errorMessage,
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    reactionDisposer();
  }

  @override
  Widget build(BuildContext context) {
    _validate() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        controller.login(context);
      }
    }

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
                return controller.isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        onPressed: _validate,
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
