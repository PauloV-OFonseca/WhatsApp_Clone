import 'package:flutter/material.dart';
import 'components/register_body.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro")
      ),
      body: RegisterBody(),
    );
  }
}
