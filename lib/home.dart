import 'package:flutter/material.dart';
import 'package:whatsapp_clone/tabs/chats_tab.dart';
import 'package:whatsapp_clone/tabs/status_tab.dart';
import 'package:whatsapp_clone/tabs/calls_tab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List<String> itensActions = [
    "Novo grupo", 
    "Nova transmissão", 
    "WhatsApp Web", 
    "Mensagens favoritas", 
    "Configurações"
  ];

  @override
  void initState(){
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this
    );
  }

  _escolhaActionItem(String escolha){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),

        bottom: TabBar(
          indicatorWeight: 4,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "Conversas",),
            Tab(text: "Status",),
            Tab(text: "Chamadas",)
          ],
        ),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            onSelected: _escolhaActionItem,
            itemBuilder: (context){
              return itensActions.map((String item){
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          )
        ],
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ChatsTab(),
          StatusTab(),
          CallsTab(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/contacts");
        },
        child: Icon(Icons.message),
      ),
    );
  }
}