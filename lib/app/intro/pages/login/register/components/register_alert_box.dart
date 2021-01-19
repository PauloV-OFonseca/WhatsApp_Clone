import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

class RegisterAlertBox {
  Future<Widget> showMyDialog(context, bool isLoading) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertBox(isLoading);
      },
    );
  }
}

class AlertBox extends StatefulWidget {
  final bool isLoading;

  const AlertBox(this.isLoading);

  @override
  _AlertBox createState() => _AlertBox();
}

class _AlertBox extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.isLoading
          ? Text("Cadastramento em andamento")
          : Text("Cadastrado com sucesso"),
      content: widget.isLoading
          ? Text("Seu usuário está sendo cadastrado, aguarde um momento")
          : Text("Usuário cadastrado, seja bem vindo!"),
      actions: <Widget>[
        widget.isLoading
            ? CircularProgressIndicator()
            : TextButton(
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
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.HOME, (_) => false);
  }
}
