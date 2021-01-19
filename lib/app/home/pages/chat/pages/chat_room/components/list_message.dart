import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/app/home/pages/chat/models/message_model.dart';
import 'package:whatsapp_clone/app/shared/consts/app_colors.dart';

class ListaDeMensagens extends StatelessWidget {
  final List<MessageModel> listMessages;
  final String uid;
  const ListaDeMensagens({Key key, this.listMessages, this.uid});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          if (listMessages != null)
            ...listMessages.map((msg) {
              bool isFromUser = (msg.remetente == uid);

              return Bubble(
                margin: isFromUser
                    ? BubbleEdges.only(top: 10, bottom: 1, left: 100)
                    : BubbleEdges.only(top: 10, bottom: 1, right: 100),
                alignment: isFromUser ? Alignment.topRight : Alignment.topLeft,
                nip: isFromUser ? BubbleNip.rightTop : BubbleNip.leftTop,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    Text(
                      msg.texto,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, left: 7),
                      child: Text(
                        DateFormat("hh:mm").format(
                            DateTime.fromMillisecondsSinceEpoch(msg.horario)),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    if (isFromUser)
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 4),
                        child: Icon(
                          Icons.done_all,
                          size: 17,
                          color: Colors.blue,
                        ),
                      ),
                  ],
                ),
                color:
                    isFromUser ? AppColors.SENDER_MESSAGE_COLOR : Colors.white,
              );
            }).toList(),
        ],
      ),
    );
  }
}
