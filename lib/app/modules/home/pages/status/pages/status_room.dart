import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/status.dart';

class StatusRoom extends StatefulWidget {
  final Status status;

  StatusRoom(this.status);

  @override
  _StatusRoomState createState() => _StatusRoomState();
}

class _StatusRoomState extends State<StatusRoom> {
  List<Widget> _getListaImagens() {
    List<String> listaUrlImagens = widget.status.imagens;
    return listaUrlImagens.map((url) {
      return Image.asset(url);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: <Widget>[
            CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(widget.status.user.foto)),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Text(widget.status.user.nome),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Carousel(
                  images: _getListaImagens(),
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.white,
                  autoplayDuration: const Duration(seconds: 7),
                  dotPosition: DotPosition.topCenter,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
