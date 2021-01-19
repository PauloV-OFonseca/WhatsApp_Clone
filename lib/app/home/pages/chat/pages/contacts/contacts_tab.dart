import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/contacts/models/user_model.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';

import 'contacts_controller.dart';

class ContactsTab extends StatefulWidget {
  final String title;
  const ContactsTab({Key key, this.title = "Contatos"}) : super(key: key);

  @override
  _ContactsTabState createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {
  List<UserModel> contactsList;
  ContactsController controller = ContactsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ...controller.userList.map((user) {
                      return ListUsers(user);
                    }).toList()
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class ListUsers extends StatefulWidget {
  final UserModel user;

  const ListUsers(this.user);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.CHATROOM, arguments: widget.user);
      },
      contentPadding: EdgeInsets.fromLTRB(16, 1, 16, 1),
      leading: CircleAvatar(
          maxRadius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(widget.user.foto == null || widget.user.foto == ""
              ? "https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-2-1.jpeg"
              : widget.user.foto)),
      title: Text(widget.user.nome, style: TextsStyles.BOLD_TITLE_STYLE),
      subtitle: Text(widget.user.status, style: TextsStyles.GENERIC_TEXT_STYLE),
    );
  }
}
