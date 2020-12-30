
class Chat {
  String _nome;
  String _ultimaMensagem;
  String _foto;

  Chat(this._nome, this._ultimaMensagem);

  String get nome => _nome;
  
  String get ultimaMensagem => _ultimaMensagem;

  set nome(String value){
    _nome = value;
  }

  set ultimaMensagem(String value){
    _ultimaMensagem = value;
  }

}