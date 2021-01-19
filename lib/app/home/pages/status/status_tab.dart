import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app/shared/consts/app_routes.dart';
import 'package:whatsapp_clone/app/shared/consts/texts_styles.dart';
import 'package:whatsapp_clone/app/shared/utils/mocks.dart';

class StatusTab extends StatefulWidget {
  @override
  _StatusTabState createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  final listStatus = Mocks().getStatus();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...listStatus.map((status) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.STATUSROOM, arguments: status);
            },
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  status.imagens[0],
                )),
            title: Text(
              status.user.nome,
              style: TextsStyles.BOLD_TITLE_STYLE,
            ),
          );
        }).toList()
      ],
    );
  }
}
