import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/user.dart';
import 'package:whatsapp_clone/utils/mocks.dart';

class ChatsTab extends StatefulWidget {
  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  
  final listUser = Mocks().getUsers();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listUser.length,
      itemBuilder: (context, index){

        User user = listUser[index];

        return ListTile(
          onTap: (){
            Navigator.pushNamed(context, "/chatroom", arguments: user);
          },
          contentPadding:EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(user.foto)
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