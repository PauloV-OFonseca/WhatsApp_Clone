// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    this.foto,
    this.id,
    this.mensagensNaoLdias,
    this.silenciado,
    this.titulo,
    this.ultimaMensagem,
    this.visualizado,
  });

  String foto;
  String id;
  int mensagensNaoLdias;
  bool silenciado;
  String titulo;
  UltimaMensagem ultimaMensagem;
  bool visualizado;

  ChatModel copyWith({
    String foto,
    String id,
    int mensagensNaoLdias,
    bool silenciado,
    String titulo,
    UltimaMensagem ultimaMensagem,
    bool visualizado,
  }) =>
      ChatModel(
        foto: foto ?? this.foto,
        id: id ?? this.id,
        mensagensNaoLdias: mensagensNaoLdias ?? this.mensagensNaoLdias,
        silenciado: silenciado ?? this.silenciado,
        titulo: titulo ?? this.titulo,
        ultimaMensagem: ultimaMensagem ?? this.ultimaMensagem,
        visualizado: visualizado ?? this.visualizado,
      );

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        foto: json["foto"] == null ? null : json["foto"],
        id: json["id"] == null ? null : json["id"],
        mensagensNaoLdias: json["mensagens_nao_ldias"] == null
            ? null
            : json["mensagens_nao_ldias"],
        silenciado: json["silenciado"] == null ? null : json["silenciado"],
        titulo: json["titulo"] == null ? null : json["titulo"],
        ultimaMensagem: json["ultima_mensagem"] == null
            ? null
            : UltimaMensagem.fromJson(json["ultima_mensagem"]),
        visualizado: json["visualizado"] == null ? null : json["visualizado"],
      );

  Map<String, dynamic> toJson() => {
        "foto": foto == null ? null : foto,
        "id": id == null ? null : id,
        "mensagens_nao_ldias":
            mensagensNaoLdias == null ? null : mensagensNaoLdias,
        "silenciado": silenciado == null ? null : silenciado,
        "titulo": titulo == null ? null : titulo,
        "ultima_mensagem":
            ultimaMensagem == null ? null : ultimaMensagem.toJson(),
        "visualizado": visualizado == null ? null : visualizado,
      };
}

class UltimaMensagem {
  UltimaMensagem({
    this.horario,
    this.remetente,
    this.texto,
  });

  String horario;
  String remetente;
  String texto;

  UltimaMensagem copyWith({
    String horario,
    String remetente,
    String texto,
  }) =>
      UltimaMensagem(
        horario: horario ?? this.horario,
        remetente: remetente ?? this.remetente,
        texto: texto ?? this.texto,
      );

  factory UltimaMensagem.fromJson(Map<String, dynamic> json) => UltimaMensagem(
        horario: json["horario"] == null ? null : json["horario"],
        remetente: json["remetente"] == null ? null : json["remetente"],
        texto: json["texto"] == null ? null : json["texto"],
      );

  Map<String, dynamic> toJson() => {
        "horario": horario == null ? null : horario,
        "remetente": remetente == null ? null : remetente,
        "texto": texto == null ? null : texto,
      };
}
