import 'package:whatsapp_clone/app/modules/home/pages/chat/modules/chat_room/pages/detail_user.dart';
import 'package:whatsapp_clone/app/modules/home/pages/chat/modules/chat_room/services/chat_room_service.dart';

import '../../../../../../shared/consts/app_routes.dart';
import 'chat_room_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'chat_room_page.dart';

class ChatRoomModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatRoomService()),
        Bind((i) => ChatRoomController(i.get<ChatRoomService>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => ChatRoomPage(
            args.data["user"],
            args.data["uid"],
          ),
        ),
        ModularRouter(
          AppRoutes.DETAILUSER,
          child: (_, args) => DetailUser(args.data),
        )
      ];

  static Inject get to => Inject<ChatRoomModule>.of();
}
