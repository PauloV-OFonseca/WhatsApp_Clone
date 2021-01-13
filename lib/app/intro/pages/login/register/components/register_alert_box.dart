import 'package:flutter/material.dart';

class RegisterAlertBox {
  Future<Widget> showMyDialog(context, bool isLoading) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return isLoading ? LoadingRegister() : SuccessRegister();
      },
    );
  }
}

class SuccessRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Usuário cadastrado com sucesso!'),
      content: SingleChildScrollView(
          child: Text("Usuário cadastrado, seja bem vindo!")),
      actions: <Widget>[
        TextButton(
          child: Text('Ok.'),
          onPressed: () {
            Navigator.of(context).pop();
            navigateToHome(context);
          },
        ),
      ],
    );
  }

  navigateToHome(context) {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (_) => false);
  }
}

class LoadingRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cadastramento em andamento'),
      content: SingleChildScrollView(
          child: Text("Seu usuário está sendo cadastrado, aguarde um momento")),
      actions: <Widget>[CircularProgressIndicator()],
    );
  }

}
