import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/user.dart';

class DetailUser extends StatefulWidget {
  final User contato;

  DetailUser(this.contato);

  @override
  _DetailUserState createState() => _DetailUserState();
}


class _DetailUserState extends State<DetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contato.nome),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(widget.contato.foto),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(widget.contato.recado),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(widget.contato.numero),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
  
}