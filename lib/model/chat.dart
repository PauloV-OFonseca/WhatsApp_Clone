
class Chat {
  String _nome;
  String _mensagem;
  String _foto;

  Chat(this._nome, this._mensagem);

  String get nome => _nome;
  
  String get mensagem => _mensagem;

  set nome(String value){
    _nome = value;
  }

  set mensagem(String value){
    _nome = value;
  }

}