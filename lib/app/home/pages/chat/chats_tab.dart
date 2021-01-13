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
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "/chatroom", arguments: user);
                },
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                leading: GenericAvatar().circleProfile(user.foto),
                title: Text(
                  user.nome,
                  style: TextsStyles.BOLD_TITLE_STYLE,
                ),
                subtitle: Text(
                  user.recado,
                  style: TextsStyles.GENERIC_TEXT_STYLE,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "08:22",
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.volume_off),
                        SizedBox(
                          width: 4,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(85, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.20, color: Colors.grey),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ],
    );
  }
}
