import 'package:whatsapp_clone/model/user.dart';

class Call {
  final User user;
  final DateTime horario;
  final String tipo; // Voz ou Video
  final bool isEfetuada;
  final bool isAtendido;

  Call(this.user, this.horario, this.tipo, this.isEfetuada, this.isAtendido);
}
