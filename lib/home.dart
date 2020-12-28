import 'package:flutter/material.dart';

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
          Text("Conversas"),
          Text("Status"),
          Text("Chamadas"),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.message),
      ),
    );
  }
}