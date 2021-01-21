import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/shared/consts/app_colors.dart';

class CaixaDeMensagens extends StatefulWidget {
  final Function onTap;
  final String uid;

  const CaixaDeMensagens({Key key, this.onTap, this.uid});

  @override
  _CaixaDeMensagensState createState() => _CaixaDeMensagensState();
}

class _CaixaDeMensagensState extends State<CaixaDeMensagens> {
  TextEditingController _controllerTextFormField;

  _onSubmit() {
    if (_controllerTextFormField.text.isNotEmpty) {
      widget.onTap(_controllerTextFormField.text, widget.uid);
      _controllerTextFormField.text = "";
      _closeKeyBoard();
    }
  }

  _closeKeyBoard() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    _controllerTextFormField = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerTextFormField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 8),
            child: TextFormField(
              // onFieldSubmitted: (_) => _closeKeyBoard(),
              controller: _controllerTextFormField,
              autofocus: false,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                hintText: "Digite uma mensagem...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: null,
                ),
              ),
            ),
          ),
        ),
        FloatingActionButton(
          backgroundColor: AppColors.PRIMARY_COLOR,
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
          mini: true,
          onPressed: _onSubmit,
        )
      ]),
    );
  }
}
