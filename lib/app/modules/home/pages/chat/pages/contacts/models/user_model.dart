// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.foto,
    this.nome,
    this.key,
  });

  String status;
  String foto;
  String nome;
  String key;

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        status: json["email"] == null ? null : json["email"],
        foto: json["foto"] == null ? null : json["foto"],
        nome: json["nome"] == null ? null : json["nome"],
        key: json["key"] == null ? null : json["key"],
      );

  Map<String, dynamic> toJson() => {
        "email": status == null ? null : status,
        "foto": foto == null ? null : foto,
        "nome": nome == null ? null : nome,
        "key": key == null ? null : key,
      };
}
