import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/chats_tab.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/message_widget.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/text_form_message.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

import 'chat_room_controller.dart';

class ChatRoom extends StatefulWidget {
  final ScreenArguments arguments;

  ChatRoom(this.arguments);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final controller = ChatRoomController();

  _closeKeyBoard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(widget.arguments.user.foto),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Text(widget.arguments.user.nome),
                      onTap: () {
                        _closeKeyBoard();
                        _navigateToDetailUser();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: GestureDetector(
            onTap: _closeKeyBoard,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Observer(
                builder: (_) {
                  return Column(
                    children: [
                      MessageWidget(
                        listMessages: controller.messagesList,
                        uid: widget.arguments.uid,
                      ),
                      CaixaDeMensagens(
                        onTap: controller.addMessage,
                        uid: widget.arguments.uid,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  _navigateToDetailUser() {
    Navigator.pushNamed(
      context,
      AppRoutes.DETAILUSER,
      arguments: widget.arguments.user,
    );
  }
}
