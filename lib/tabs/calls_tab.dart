import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/model/call.dart';
import 'package:whatsapp_clone/utils/mocks.dart';

class CallsTab extends StatefulWidget {
  @override
  _CallsTabState createState() => _CallsTabState();
}

class _CallsTabState extends State<CallsTab> {
  final listCall = Mocks().getCalls();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listCall.length,
        itemBuilder: (context, index) {
          Call call = listCall[index];

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(call.user.foto)),
            title: Text(
              call.user.nome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(children: [
              _icones(call),
              Text(
                DateFormat('dd/MM  kk:mm').format(call.horario),
                style: TextStyle(fontSize: 14),
              ),
            ]),
            trailing: Icon(call.tipo == 'voz' ? Icons.phone : Icons.videocam),
          );
        });
  }

  Widget _icones(Call call) {
    if (!call.isEfetuada && call.isAtendido){
      return Icon(
        Icons.call_received,
        color: Color(0xFF075E54),
      );
    }
    if (!call.isEfetuada && !call.isAtendido) {
      return Icon(
        Icons.call_received,
        color: Color(0xFFC62828)
      );
    }
    else{
      return Icon(
        Icons.call_made,
        color: Color(0xFF075E54)
      );
    }
  }
}
