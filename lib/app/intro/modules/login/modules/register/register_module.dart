import 'package:whatsapp_clone/app/intro/modules/login/modules/register/components/register_alert_box.dart';
import 'package:whatsapp_clone/app/intro/modules/login/modules/register/services/register_auth_service.dart';
import 'package:whatsapp_clone/app/intro/modules/login/modules/register/services/storage_service.dart';

import 'register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterAuthService()),
        Bind((i) => StorageService()),
        Bind(
          (i) => RegisterController(
            i.get<RegisterAuthService>(),
            i.get<StorageService>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
