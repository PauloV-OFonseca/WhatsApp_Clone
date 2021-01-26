// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_tab_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatTabController on _ChatTabControllerBase, Store {
  final _$chatListAtom = Atom(name: '_ChatTabControllerBase.chatList');

  @override
  ObservableList<ChatModel> get chatList {
    _$chatListAtom.reportRead();
    return super.chatList;
  }

  @override
  set chatList(ObservableList<ChatModel> value) {
    _$chatListAtom.reportWrite(value, super.chatList, () {
      super.chatList = value;
    });
  }

  final _$userUIDAtom = Atom(name: '_ChatTabControllerBase.userUID');

  @override
  String get userUID {
    _$userUIDAtom.reportRead();
    return super.userUID;
  }

  @override
  set userUID(String value) {
    _$userUIDAtom.reportWrite(value, super.userUID, () {
      super.userUID = value;
    });
  }

  @override
  String toString() {
    return '''
chatList: ${chatList},
userUID: ${userUID}
    ''';
  }
}
