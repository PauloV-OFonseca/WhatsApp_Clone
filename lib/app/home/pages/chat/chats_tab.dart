import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/home/pages/chat/chat_tab_controller.dart';
import 'package:whatsapp_clone/app/shared/components/generic_avatar.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';

class ChatsTab extends StatefulWidget {
  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  final controller = ChatTabController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...controller.chatList.map((user) {
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
        }),
      ],
    );

    // ListView.builder(
    //     itemCount: controller.chatList.length,
    //     itemBuilder: (context, index) {
    //       User user = controller.chatList[index];

    //       return ListTile(
    //         onTap: () {
    //           Navigator.pushNamed(context, "/chatroom", arguments: user);
    //         },
    //         contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    //         leading: GenericAvatar().circleProfile(user.foto),
    //         title: Text(
    //           user.nome,
    //           style: TextsStyles.BOLD_TITLE_STYLE,
    //         ),
    //         subtitle: Text(
    //           user.recado,
    //           style: TextsStyles.GENERIC_TEXT_STYLE,
    //         ),
    //       );
    //     });
  }
}
