import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/shared/consts/app_colors.dart';

class CaixaDeMensagens extends StatefulWidget {
  @override
  _CaixaDeMensagensState createState() => _CaixaDeMensagensState();
}

class _CaixaDeMensagensState extends State<CaixaDeMensagens> {
  final TextEditingController _controllerMensagem = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controllerMensagem.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 8),
            child: TextField(
              controller: _controllerMensagem,
              autofocus: true,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                  hintText: "Digite uma mensagem...",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: null,
                  )),
            ),
          ),
        ),
        FloatingActionButton(
          backgroundColor: AppColors.PRIMARY_COLOR,
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
          mini: true,
          onPressed: null,
        )
      ]),
    );
  }
}
