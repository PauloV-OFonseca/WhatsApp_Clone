import 'package:flutter/material.dart';
import "package:whatsapp_clone/model/user.dart";

class ChatRoom extends StatefulWidget {

  User contato;

  ChatRoom(this.contato);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.contato.nome),),
      body: Container(),
    );
  }
}