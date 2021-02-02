import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_clone/app/app_controller.dart';
import 'package:whatsapp_clone/app/app_widget.dart';
import 'package:whatsapp_clone/app/intro/modules/login/login_module.dart';
import 'package:whatsapp_clone/app/intro/splash_screen.dart';
import 'package:whatsapp_clone/app/modules/home/home_module.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';
import 'package:whatsapp_clone/app/shared/services/auth_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashScreen()),
        ModularRouter(AppRoutes.LOGIN, module: LoginModule()),
        ModularRouter(AppRoutes.HOME, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
