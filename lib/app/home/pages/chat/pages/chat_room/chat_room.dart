import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/chat_model.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/message_widget.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/components/text_form_message.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

import 'chat_room_controller.dart';

class ChatRoom extends StatefulWidget {
  final Map<String, dynamic> arguments;

  ChatRoom(this.arguments);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  ChatRoomController controller = ChatRoomController();
  ChatModel user;
  String uid;

  @override
  void initState() {
    super.initState();
    user = widget.arguments["user"];
    uid = widget.arguments["uid"];
    controller.init(
      user.conversaId,
    );
  }

  _closeKeyBoard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(user.imagem),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Text(user.nome),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.messagesList != null
                        ? [
                            MessageWidget(
                              listMessages: controller.messagesList,
                              uid: uid,
                            ),
                            CaixaDeMensagens(
                              onTap: controller.sendMessage,
                              uid: uid,
                            ),
                          ]
                        : [
                            Center(
                              child: CircularProgressIndicator(),
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
      arguments: user,
    );
  }
}
