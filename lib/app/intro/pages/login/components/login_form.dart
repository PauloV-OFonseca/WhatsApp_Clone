import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginForm extends StatelessWidget {
  final String title;
  final onChanged;
  final String Function() errorText;

  LoginForm({this.title, this.onChanged, this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      child: Observer(
        builder: (_) {
          return TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: title,
              border: OutlineInputBorder(),
              errorText: errorText(),
            ),
          );
        },
      ),
    );
  }
}
