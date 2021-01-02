import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/status.dart';
import 'package:whatsapp_clone/utils/mocks.dart';

class StatusTab extends StatefulWidget {
  @override
  _StatusTabState createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  final listStatus = Mocks().getStatus();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listStatus.length,
      itemBuilder: (context, index){

        Status status = listStatus[index];

        return ListTile(
          onTap: (){
            Navigator.pushNamed(context, "/statusroom", arguments: status);
          },
          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 20,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(status.imagens[0],)
          ),
          title: Text(
            status.user.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        );
      }
    );
  }

}