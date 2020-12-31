import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/user.dart';

class ContactsTab extends StatefulWidget {
  @override
  _ContactsTabState createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {

  List<User> listaConversas = [
    User(
      "Pessoa 1", "A", "123"
    ),
    User(
      "Pessoa 2", "B", "456"
    ),
    User(
      "Pessoa 3", "C", "789"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder: (context, index){

          User user = listaConversas[index];

          return ListTile(
            contentPadding:EdgeInsets.fromLTRB(16, 1, 16, 1),
            leading: CircleAvatar(
              maxRadius: 20,
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
      )
    );
  }

}