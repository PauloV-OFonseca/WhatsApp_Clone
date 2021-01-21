import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/chat_model.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/message_widget.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/text_form_message.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

import 'chat_room_controller.dart';

class ChatRoom extends StatefulWidget {
  final ChatModel user;

  ChatRoom(this.user);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  ChatRoomController controller = ChatRoomController();

  @override
  void initState() {
    super.initState();
    controller.init(
      widget.user.conversaId,
    );
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
              backgroundImage: NetworkImage(widget.user.imagem),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Text(widget.user.nome),
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
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Observer(
              builder: (_) {
                return Column(
                  children: [
                    MessageWidget(
                      listMessages: controller.messagesList,
                      uid: widget.user.remetenteId,
                    ),
                    CaixaDeMensagens(),
                  ],
                );
              },
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
      arguments: widget.user,
    );
  }
}
