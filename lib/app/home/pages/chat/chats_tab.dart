import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/chat_tab_controller.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/chat_model.dart';
import 'package:whatsapp_clone/app/shared/components/generic_avatar.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';
import 'package:whatsapp_clone/model/user.dart';

class ChatsTab extends StatefulWidget {
  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  final controller = ChatTabController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            ...controller.chatList.map((ChatModel user) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/chatroom",
                          arguments: User(
                              foto: user.foto,
                              nome: user.titulo,
                              numero: "98998999",
                              recado: user.ultimaMensagem.texto));
                    },
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    leading: GenericAvatar().circleProfile(user.foto),
                    title: Text(
                      user.titulo,
                      style: TextsStyles.BOLD_TITLE_STYLE,
                    ),
                    subtitle: Text(
                      user.ultimaMensagem.texto,
                      style: TextsStyles.GENERIC_TEXT_STYLE,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          user.ultimaMensagem.horario,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (user.silenciado) Icon(Icons.volume_off),
                            SizedBox(
                              width: 4,
                            ),
                            if (user.mensagensNaoLidas > 0)
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    user.mensagensNaoLidas.toString(),
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
      },
    );
  }
}
