import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final String title;
  final void Function(String) onChanged;
  final bool isPassword;
  final String Function(String) validator;

  LoginForm({this.title, this.onChanged, this.validator, this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
        child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(),
          ),
        ));
  }
}
