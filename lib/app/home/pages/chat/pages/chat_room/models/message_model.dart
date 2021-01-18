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
    this.enviada,
  });

  int horario;
  String remetente;
  int status;
  String texto;
  bool enviada;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        horario: json["horario"] == null ? null : json["horario"],
        remetente: json["remetente"] == null ? null : json["remetente"],
        status: json["status"] == null ? null : json["status"],
        texto: json["texto"] == null ? null : json["texto"],
        enviada: json["enviada"] == null ? null : json["enviada"],
      );

  Map<String, dynamic> toJson() => {
        "horario": horario == null ? null : horario,
        "remetente": remetente == null ? null : remetente,
        "status": status == null ? null : status,
        "texto": texto == null ? null : texto,
        "enviada": enviada == null ? null : enviada,
      };
}
