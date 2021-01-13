// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_tab_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatTabController on _ChatTabControllerBase, Store {
  final _$chatListAtom = Atom(name: '_ChatTabControllerBase.chatList');

  @override
  ObservableList<dynamic> get chatList {
    _$chatListAtom.reportRead();
    return super.chatList;
  }

  @override
  set chatList(ObservableList<dynamic> value) {
    _$chatListAtom.reportWrite(value, super.chatList, () {
      super.chatList = value;
    });
  }

  final _$_ChatTabControllerBaseActionController =
      ActionController(name: '_ChatTabControllerBase');

  @override
  dynamic getChatList() {
    final _$actionInfo = _$_ChatTabControllerBaseActionController.startAction(
        name: '_ChatTabControllerBase.getChatList');
    try {
      return super.getChatList();
    } finally {
      _$_ChatTabControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chatList: ${chatList}
    ''';
  }
}
