import 'package:whatsapp_clone/app/modules/home/pages/chat/modules/chat_room/chat_room_module.dart';
import 'package:whatsapp_clone/app/modules/home/pages/chat/pages/contacts/contacts_tab.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter(AppRoutes.CHATROOM, module: ChatRoomModule()),
        ModularRouter(AppRoutes.CONTACTS, child: (_,args) => ContactsTab()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
