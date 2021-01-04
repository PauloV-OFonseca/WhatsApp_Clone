import 'package:flutter/material.dart';
import 'package:whatsapp_clone/consts/texts_styles.dart';
import 'package:whatsapp_clone/tabs/calls_tab.dart';
import 'package:whatsapp_clone/tabs/chats_tab.dart';
import 'package:whatsapp_clone/tabs/status_tab.dart';

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  _escolhaActionItem(String escolha) {}

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> _indexToFAB = {
      0: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/contacts");
        },
        child: Icon(Icons.message),
      ),
      1: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, "/contacts");
        },
        child: Icon(Icons.camera_alt),
      ),
      2: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, "/contacts");
        },
        child: Icon(Icons.phone),
      )
    };

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 4,
            labelStyle: TextsStyles.TAB_STYLE,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Conversas",
              ),
              Tab(
                text: "Status",
              ),
              Tab(
                text: "Chamadas",
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.search),
            ),
            PopupMenuButton<String>(
              onSelected: _escolhaActionItem,
              itemBuilder: (context) {
                return itensActions.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: TabBarView(controller: _tabController, children: [
          ChatsTab(),
          StatusTab(),
          CallsTab(),
        ]),
        floatingActionButton: _indexToFAB[_tabController.index],
      ),
    );
  }
}
