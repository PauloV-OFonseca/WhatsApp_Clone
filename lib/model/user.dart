
class User {
  String _nome;
  String _recado;
  String _numero;
  String _foto;

  User(this._nome, this._recado, this._numero);

  String get nome => _nome;
  
  String get recado => _recado;

  String get numero => _numero;

  String get foto => _foto;

  set nome(String value){
    _nome = value;
  }

  set recado(String value){
    _recado = value;
  }

  set numero(String value){
    _numero = value;
  }

  set foto(String value){
    _foto = value;
  }
}