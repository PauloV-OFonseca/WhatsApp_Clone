// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    this.horario,
    this.remetente,
    this.status,
    this.texto,
  });

  int horario;
  String remetente;
  int status;
  String texto;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        horario: json["horario"] == null ? null : json["horario"],
        remetente: json["remetente"] == null ? null : json["remetente"],
        status: json["status"] == null ? null : json["status"],
        texto: json["texto"] == null ? null : json["texto"],
      );

  Map<String, dynamic> toJson() => {
        "horario": horario == null ? null : horario,
        "remetente": remetente == null ? null : remetente,
        "status": status == null ? null : status,
        "texto": texto == null ? null : texto,
      };
}
