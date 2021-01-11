import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterForm extends StatelessWidget {
  final String title;
  final onChanged;
  final onSaved;
  final bool isPassword;
  final String Function(String) validator;

  RegisterForm({this.title, this.onChanged,  this.onSaved, this.isPassword, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      child: Observer(
        builder: (_) {
          return TextFormField(
            onChanged: onChanged,
            onSaved: onSaved,
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
