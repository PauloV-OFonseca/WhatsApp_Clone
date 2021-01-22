import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/app/home/pages/chat/pages/chat_room/models/chat_room_model.dart';
import 'package:whatsapp_clone/app/shared/consts/app_colors.dart';

class MessageWidget extends StatefulWidget {
  final List<ChatRoomModel> listMessages;
  final String uid;

  const MessageWidget({Key key, this.listMessages, this.uid});

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // ignore: null_aware_before_operator
        reverse: widget?.listMessages?.length > 12 ? true : false,
        children: [
          ...widget?.listMessages?.map((msg) {
            return MessageList(msg, widget.uid);
          })?.toList(),
        ],
      ),
    );
  }
}

class MessageList extends StatefulWidget {
  final ChatRoomModel msg;
  final String uid;

  const MessageList(this.msg, this.uid);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    bool isFromUser = (widget.msg.remetente == widget.uid);
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
            widget.msg.texto,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 7),
            child: Text(
              DateFormat("hh:mm").format(
                DateTime.fromMillisecondsSinceEpoch(widget.msg.horario),
              ),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          if (isFromUser)
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 4),
              child: buildIconStatus(StatusMessage.values[widget.msg.status]),
            )
        ],
      ),
      color: isFromUser ? AppColors.SENDER_MESSAGE_COLOR : Colors.white,
    );
  }
}

Icon buildIconStatus(StatusMessage statusMessage) {
  Icon icon;
  switch (statusMessage) {
    case StatusMessage.VISUALIZADO:
      icon = Icon(
        Icons.done_all,
        size: 17,
        color: Colors.blue,
      );
      break;
    case StatusMessage.ENTREGUE:
      icon = Icon(
        Icons.done_all,
        size: 17,
        color: Colors.grey,
      );
      break;
    case StatusMessage.NAO_ENTREGUE:
      icon = Icon(
        Icons.done,
        size: 17,
        color: Colors.grey,
      );
      break;
    case StatusMessage.NAO_ENVIADO:
      icon = Icon(
        Icons.watch_later,
        size: 17,
        color: Colors.grey,
      );
      break;
  }
  return icon;
}

enum StatusMessage { VISUALIZADO, ENTREGUE, NAO_ENTREGUE, NAO_ENVIADO }
