import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/home/pages/chat/chats_tab.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/message_widget.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/text_form_message.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

class ChatRoom extends StatefulWidget {
  final ScreenArguments arguments;
  ChatRoom(this.arguments);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
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
                        FocusScope.of(context).unfocus();
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
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                MessageWidget(
                  listMessages: widget.arguments.messageList,
                  uid: widget.arguments.uid,
                ),
                CaixaDeMensagens(),
              ],
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
