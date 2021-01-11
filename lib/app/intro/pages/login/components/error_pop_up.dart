import 'package:flutter/material.dart';

class ErrorPopUp extends StatelessWidget {
  final String errorMessage;

  const ErrorPopUp({Key key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Erro'),
      content: Text(errorMessage),
      actions: <Widget>[
        FlatButton(
          child: Text("Fechar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
