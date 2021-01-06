import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/shared/components/generic_avatar.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';
import 'package:whatsapp_clone/app/shared/utils/mocks.dart';
import 'package:whatsapp_clone/model/user.dart';

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
        itemBuilder: (context, index) {
          User user = listUser[index];

          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/chatroom", arguments: user);
            },
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: GenericAvatar().circleProfile(user.foto),
            title: Text(
              user.nome,
              style: TextsStyles.BOLD_TITLE_STYLE,
            ),
            subtitle: Text(
              user.recado,
              style: TextsStyles.GENERIC_TEXT_STYLE,
            ),
          );
        });
  }
}
