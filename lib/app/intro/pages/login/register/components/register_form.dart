import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterForm extends StatelessWidget {
  final String title;
  final onChanged;
  final bool isPassword;
  final String Function(String) validator;

  RegisterForm({this.title, this.onChanged, this.isPassword, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      child: Observer(
        builder: (_) {
          return TextFormField(
            onChanged: onChanged,
            obscureText: isPassword,
            validator: validator,
            decoration: InputDecoration(
              labelText: title,
              border: OutlineInputBorder(),
            ),
          );
        },
      ),
    );
  }
}
