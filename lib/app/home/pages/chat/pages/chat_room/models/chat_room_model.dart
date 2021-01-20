// To parse this JSON data, do
//
//     final chatRoomModel = chatRoomModelFromJson(jsonString);

import 'dart:convert';

ChatRoomModel chatRoomModelFromJson(String str) => ChatRoomModel.fromJson(json.decode(str));

String chatRoomModelToJson(ChatRoomModel data) => json.encode(data.toJson());

class ChatRoomModel {
    ChatRoomModel({
        this.remetente,
        this.texto,
        this.horario,
        this.status,
        this.key,
    });

    String remetente;
    String texto;
    int horario;
    int status;
    String key;

    ChatRoomModel copyWith({
        String remetente,
        String texto,
        int horario,
        int status,
        String key,
    }) => 
        ChatRoomModel(
            remetente: remetente ?? this.remetente,
            texto: texto ?? this.texto,
            horario: horario ?? this.horario,
            status: status ?? this.status,
            key: key ?? this.key,
        );

    factory ChatRoomModel.fromJson(Map<String, dynamic> json) => ChatRoomModel(
        remetente: json["remetente"],
        texto: json["texto"],
        horario: json["horario"],
        status: json["status"],
        key: json["key"],
    );

    Map<String, dynamic> toJson() => {
        "remetente": remetente,
        "texto": texto,
        "horario": horario,
        "status": status,
        "key": key,
    };
}
