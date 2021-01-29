import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;

  escolhaActionItem(String escolha) {
    switch (escolha) {
      case "Deslogar":
        _signOut();
    }
  }

  _signOut() async {
    await auth.signOut();

    Modular.to.pushReplacementNamed(AppRoutes.LOGIN);
  }
}
