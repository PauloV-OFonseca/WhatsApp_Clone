import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_clone/app/modules/home/pages/call/calls_tab.dart';
import 'package:whatsapp_clone/app/modules/home/pages/chat/chats_tab.dart';
import 'package:whatsapp_clone/app/modules/home/pages/status/status_tab.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> itensActions = ["Deslogar"];

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

  _escolhaActionItem(String escolha) {
    switch (escolha) {
      case "Deslogar":
        _signOut();
    }
  }

  _signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    Modular.to.pushReplacementNamed(AppRoutes.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> _indexToFAB = {
      0: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed(AppRoutes.CONTACTS);
        },
        child: Icon(Icons.message),
      ),
      1: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.camera_alt),
      ),
      2: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.phone),
      )
    };

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("WhatsApp"),
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 4,
            labelStyle: TextsStyles.TAB_STYLE,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Conversas"),
              Tab(text: "Status"),
              Tab(text: "Chamadas"),
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
        body: TabBarView(
          controller: _tabController,
          children: [
            ChatsTab(),
            StatusTab(),
            CallsTab(),
          ],
        ),
        floatingActionButton: _indexToFAB[_tabController.index],
      ),
    );
  }
}
