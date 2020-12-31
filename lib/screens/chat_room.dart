import 'package:flutter/material.dart';
import "package:whatsapp_clone/model/user.dart";

class ChatRoom extends StatefulWidget {
  User contato;

  ChatRoom(this.contato);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<String> listaMensagens = ["Olá", "Tudo bem?"];
  TextEditingController _controllerMensagem = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var caixaMensagem = Container(
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
          backgroundColor: Color(0xff075E54),
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
          mini: true,
          onPressed: null,
        )
      ]),
    );

    var listView = Expanded(
      child: ListView.builder(
          itemCount: listaMensagens.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xffd2ffa5),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Text(listaMensagens[index],
                      style: TextStyle(fontSize: 14)),
                ),
              ),
            );
          }),
    );

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
              child: Text(widget.contato.nome),
            ),
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
              listView,
              caixaMensagem,
            ],
          ),
        )),
      ),
    );
  }
}
