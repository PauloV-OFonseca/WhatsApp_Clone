// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  String remetenteId;
  String conversaId;
  String imagem;
  int mensagensNaoLidas;
  String nome;
  bool silenciado;
  UltimaMensagem ultimaMensagem;
  int status;

  ChatModel({
    this.remetenteId,
    this.conversaId,
    this.imagem,
    this.mensagensNaoLidas,
    this.nome,
    this.silenciado,
    this.ultimaMensagem,
    this.status,
  });

  ChatModel copyWith({
    String remetenteId,
    String conversaId,
    String imagem,
    int mensagensNaoLidas,
    String nome,
    bool silenciado,
    UltimaMensagem ultimaMensagem,
    int status,
  }) =>
      ChatModel(
        remetenteId: remetenteId ?? this.remetenteId,
        conversaId: conversaId ?? this.conversaId,
        imagem: imagem ?? this.imagem,
        mensagensNaoLidas: mensagensNaoLidas ?? this.mensagensNaoLidas,
        nome: nome ?? this.nome,
        silenciado: silenciado ?? this.silenciado,
        ultimaMensagem: ultimaMensagem ?? this.ultimaMensagem,
        status: status ?? this.status,
      );

  factory ChatModel.fromJson(Map<dynamic, dynamic> json) => ChatModel(
        remetenteId: json["remetente_id"],
        conversaId: json["conversa_id"],
        imagem: json["imagem"],
        mensagensNaoLidas: json["mensagens_nao_lidas"],
        nome: json["nome"],
        silenciado: json["silenciado"],
        ultimaMensagem: UltimaMensagem.fromJson(json["ultima_mensagem"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "remetente_id": remetenteId,
        "conversa_id": conversaId,
        "imagem": imagem,
        "mensagens_nao_lidas": mensagensNaoLidas,
        "nome": nome,
        "silenciado": silenciado,
        "ultima_mensagem": ultimaMensagem.toJson(),
        "status": status,
      };
}

class UltimaMensagem {
  int horario;
  String remetente;
  String texto;

  UltimaMensagem({
    this.horario,
    this.remetente,
    this.texto,
  });

  UltimaMensagem copyWith({
    int horario,
    String remetente,
    String texto,
  }) =>
      UltimaMensagem(
        horario: horario ?? this.horario,
        remetente: remetente ?? this.remetente,
        texto: texto ?? this.texto,
      );

  factory UltimaMensagem.fromJson(Map<dynamic, dynamic> json) => UltimaMensagem(
        horario: json["horario"],
        remetente: json["remetente"],
        texto: json["texto"],
      );

  Map<String, dynamic> toJson() => {
        "horario": horario,
        "remetente": remetente,
        "texto": texto,
      };
}
