// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatRoomController on _ChatRoomController, Store {
  final _$conversaIDAtom = Atom(name: '_ChatRoomController.conversaID');

  @override
  String get conversaID {
    _$conversaIDAtom.reportRead();
    return super.conversaID;
  }

  @override
  set conversaID(String value) {
    _$conversaIDAtom.reportWrite(value, super.conversaID, () {
      super.conversaID = value;
    });
  }

  final _$messagesListAtom = Atom(name: '_ChatRoomController.messagesList');

  @override
  ObservableList<ChatRoomModel> get messagesList {
    _$messagesListAtom.reportRead();
    return super.messagesList;
  }

  @override
  set messagesList(ObservableList<ChatRoomModel> value) {
    _$messagesListAtom.reportWrite(value, super.messagesList, () {
      super.messagesList = value;
    });
  }

  final _$addMessageAsyncAction = AsyncAction('_ChatRoomController.addMessage');

  @override
  Future addMessage(String newText, String uid) {
    return _$addMessageAsyncAction.run(() => super.addMessage(newText, uid));
  }

  final _$_ChatRoomControllerActionController =
      ActionController(name: '_ChatRoomController');

  @override
  dynamic setMessageList(dynamic newList) {
    final _$actionInfo = _$_ChatRoomControllerActionController.startAction(
        name: '_ChatRoomController.setMessageList');
    try {
      return super.setMessageList(newList);
    } finally {
      _$_ChatRoomControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
conversaID: ${conversaID},
messagesList: ${messagesList}
    ''';
  }
}
