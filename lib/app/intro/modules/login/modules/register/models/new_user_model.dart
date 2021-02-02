import 'dart:convert';

NewUserModel newUserModelFromJson(String str) => NewUserModel.fromJson(json.decode(str));

String newUserModelToJson(NewUserModel data) => json.encode(data.toJson());

class NewUserModel {
    NewUserModel({
        this.dados,
        this.senha,
    });

    Dados dados;
    String senha;

    factory NewUserModel.fromJson(Map<String, dynamic> json) => NewUserModel(
        dados: Dados.fromJson(json["dados"]),
        senha: json["senha"],
    );

    Map<String, dynamic> toJson() => {
        "dados": dados.toJson(),
        "senha": senha,
    };
}

class Dados {
    Dados({
        this.nome,
        this.email,
        this.foto,
    });

    String nome;
    String email;
    String foto;

    factory Dados.fromJson(Map<String, dynamic> json) => Dados(
        nome: json["nome"],
        email: json["email"],
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "email": email,
        "foto": foto,
    };
}