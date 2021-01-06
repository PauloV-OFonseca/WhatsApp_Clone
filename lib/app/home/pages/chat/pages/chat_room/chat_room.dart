import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/shared/consts/app_colors.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';
import "package:whatsapp_clone/model/user.dart";

class ChatRoom extends StatefulWidget {
  final User contato;

  ChatRoom(this.contato);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(widget.contato.foto)),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Text(widget.contato.nome),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(context, "/detailuser",
                            arguments: widget.contato);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              ListaDeMensagens(),
              CaixaDeMensagens(),
            ],
          ),
        )),
      ),
    );
  }
}

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

class ListaDeMensagens extends StatelessWidget {
  final List<String> listaMensagens = ["Olá", "Tudo bem?"];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ...listaMensagens.map((msg) {
            return Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.SENDER_MESSAGE_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Text(msg, style: TextsStyles.GENERIC_TEXT_STYLE),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
