import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_clone/app/app_controller.dart';
import 'package:whatsapp_clone/app/app_widget.dart';
import 'package:whatsapp_clone/app/home/home.dart';
import 'package:whatsapp_clone/app/intro/pages/login/login.dart';
import 'package:whatsapp_clone/app/intro/pages/login/register/register.dart';
import 'package:whatsapp_clone/app/intro/splash_screen.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(AppRoutes.INTRO, child: (_, args) => SplashScreen()),
        ModularRouter(AppRoutes.LOGIN, child: (_, args) => Login()),
        ModularRouter(AppRoutes.HOME, child: (_, args) => Home()),
        ModularRouter(AppRoutes.REGISTER, child: (_, args) => Register())
      ];

  @override
  Widget get bootstrap => AppWidget();
}
