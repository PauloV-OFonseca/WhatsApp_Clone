// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatRoomController on _ChatRoomController, Store {
  final _$messagesListAtom = Atom(name: '_ChatRoomController.messagesList');

  @override
  ObservableList<MessageModel> get messagesList {
    _$messagesListAtom.reportRead();
    return super.messagesList;
  }

  @override
  set messagesList(ObservableList<MessageModel> value) {
    _$messagesListAtom.reportWrite(value, super.messagesList, () {
      super.messagesList = value;
    });
  }

  @override
  String toString() {
    return '''
messagesList: ${messagesList}
    ''';
  }
}
