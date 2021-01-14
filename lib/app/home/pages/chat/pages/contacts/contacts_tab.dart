import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/contacts/models/user_model.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';

import 'contacts_controller.dart';
import 'services/contact_services.dart';

class ContactsTab extends StatefulWidget {
  final String title;
  const ContactsTab({Key key, this.title = "Contatos"}) : super(key: key);

  @override
  _ContactsTabState createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {
  //ContactServices contactServices = ContactServices();
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
              children: [
                ...controller.userList.map((user) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/chatroom",
                          arguments: user);
                    },
                    contentPadding: EdgeInsets.fromLTRB(16, 1, 16, 1),
                    leading: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(user.foto)),
                    title: Text(user.nome, style: TextsStyles.BOLD_TITLE_STYLE),
                    subtitle: Text(user.status,
                        style: TextsStyles.GENERIC_TEXT_STYLE),
                  );
                }).toList()
              ],
            );
          },
        )
        // Column(
        //   children: [
        //     ...listUser.map((user) {
        //       return ListTile(
        //         onTap: () {
        //           Navigator.pushNamed(context, "/chatroom", arguments: user);
        //         },
        //         contentPadding: EdgeInsets.fromLTRB(16, 1, 16, 1),
        //         leading: CircleAvatar(
        //             maxRadius: 20,
        //             backgroundColor: Colors.grey,
        //             backgroundImage: NetworkImage(user.foto)),
        //         title: Text(user.nome, style: TextsStyles.BOLD_TITLE_STYLE),
        //         subtitle:
        //             Text(user.recado, style: TextsStyles.GENERIC_TEXT_STYLE),
        //       );
        //     }).toList()
        //   ],
        // )
        );
  }
}
