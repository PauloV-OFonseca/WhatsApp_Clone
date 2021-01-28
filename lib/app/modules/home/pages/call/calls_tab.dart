import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/app/shared/components/generic_avatar.dart';
import 'package:whatsapp_clone/app/shared/consts/app_colors.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';
import 'package:whatsapp_clone/app/shared/utils/mocks.dart';
import 'package:whatsapp_clone/model/call.dart';

class CallsTab extends StatefulWidget {
  @override
  _CallsTabState createState() => _CallsTabState();
}

class _CallsTabState extends State<CallsTab> {
  final listCall = Mocks().getCalls();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...listCall.map((call) {
          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: GenericAvatar().circleProfile(call.user.foto),
            title: Text(
              call.user.nome,
              style: TextsStyles.BOLD_TITLE_STYLE,
            ),
            subtitle: Row(children: [
              _icones(call),
              Text(
                DateFormat('dd/MM  kk:mm').format(call.horario),
                style: TextsStyles.GENERIC_TEXT_STYLE,
              ),
            ]),
            trailing: Icon(call.tipo == 'voz' ? Icons.phone : Icons.videocam),
          );
        }).toList()
      ],
    );
  }

  Widget _icones(Call call) {
    if (!call.isEfetuada && call.isAtendido) {
      return Icon(Icons.call_received, color: AppColors.PRIMARY_COLOR);
    }
    if (!call.isEfetuada && !call.isAtendido) {
      return Icon(Icons.call_received, color: AppColors.REJECT_COLOR);
    } else {
      return Icon(Icons.call_made, color: AppColors.PRIMARY_COLOR);
    }
  }
}
