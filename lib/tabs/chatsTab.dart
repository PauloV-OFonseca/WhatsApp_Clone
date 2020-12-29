import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/chat.dart';

class ChatsTab extends StatefulWidget {
  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  
  List<Chat> listaChats = [
    Chat(
      "Pessoa 1", "Olá"
    ),
    Chat(
      "Pessoa 2", "Oi, tudo bom?"
    ),
    Chat(
      "Pessoa 3", "Quem é?"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaChats.length,
      itemBuilder: (context, index){

        Chat chat = listaChats[index];

        return ListTile(
          contentPadding:EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey
          ),
          title: Text(
            chat.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          subtitle: Text(
            chat.mensagem,
            style: TextStyle(
              fontSize: 14
            ),
          ),
        );
      }
    );
  }
}