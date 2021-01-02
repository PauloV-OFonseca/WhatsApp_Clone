import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/user.dart';
import 'package:whatsapp_clone/utils/mocks.dart';

class ContactsTab extends StatefulWidget {
  @override
  _ContactsTabState createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {

  final listUser = Mocks().getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index){

          User user = listUser[index];

          return ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/chatroom", arguments: user);
            },
            contentPadding:EdgeInsets.fromLTRB(16, 1, 16, 1),
            leading: CircleAvatar(
              maxRadius: 20,
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
      )
    );
  }

}