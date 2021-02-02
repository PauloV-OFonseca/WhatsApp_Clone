// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatRoomController on _ChatRoomControllerBase, Store {
  final _$conversaIDAtom = Atom(name: '_ChatRoomControllerBase.conversaID');

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

  final _$messagesListAtom = Atom(name: '_ChatRoomControllerBase.messagesList');

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

  final _$_ChatRoomControllerBaseActionController =
      ActionController(name: '_ChatRoomControllerBase');

  @override
  dynamic setMessageList(dynamic newList) {
    final _$actionInfo = _$_ChatRoomControllerBaseActionController.startAction(
        name: '_ChatRoomControllerBase.setMessageList');
    try {
      return super.setMessageList(newList);
    } finally {
      _$_ChatRoomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addMessage(ChatRoomModel newMessage) {
    final _$actionInfo = _$_ChatRoomControllerBaseActionController.startAction(
        name: '_ChatRoomControllerBase.addMessage');
    try {
      return super.addMessage(newMessage);
    } finally {
      _$_ChatRoomControllerBaseActionController.endAction(_$actionInfo);
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
