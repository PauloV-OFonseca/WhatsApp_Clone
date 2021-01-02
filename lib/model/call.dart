import 'package:whatsapp_clone/model/user.dart';

class Call {
  final User user;
  final DateTime horario;
  final String tipo; // Voz ou Video

  Call(this.user, this.horario, this.tipo);

}
