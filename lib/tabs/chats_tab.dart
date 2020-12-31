import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/chat.dart';
import 'package:whatsapp_clone/model/user.dart';

class ChatsTab extends StatefulWidget {
  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  
  List<User> listaUser = [
    User(
      "Pessoa 1", "Olá", "1"
    ),
    User(
      "Pessoa 2", "Oi, tudo bom?", "1"
    ),
    User(
      "Pessoa 3", "Quem é?", "1"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaUser.length,
      itemBuilder: (context, index){

        User user = listaUser[index];

        return ListTile(
          onTap: (){
            Navigator.pushNamed(context, "/chatroom", arguments: user);
          },
          contentPadding:EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey
          ),
          title: Text(
            user.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          subtitle: Text(
            user.recado,
            style: TextStyle(
              fontSize: 14
            ),
          ),
        );
      }
    );
  }
}