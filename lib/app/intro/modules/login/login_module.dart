import 'package:whatsapp_clone/app/intro/modules/login/modules/register/register_module.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';
import 'package:whatsapp_clone/app/shared/services/auth_service.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i)=> AuthService()),
        Bind((i) => LoginController(i.get<AuthService>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter(AppRoutes.REGISTER, module: RegisterModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
