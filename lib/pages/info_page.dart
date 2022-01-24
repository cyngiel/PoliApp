import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('O Aplikacji'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: RichText(
      text: const TextSpan(
        text: 'Wszelkie uwagi i sugestie proszę kierować na adress mailowy:\n',
        style: TextStyle(color: Colors.black, fontSize: 18.0),
        children: <TextSpan>[
          TextSpan(
              text: 'administracja@poliapp.p.lodz.pl\n',
              style: TextStyle(fontWeight: FontWeight.bold, )
          ),
        ],
      ),
    )
  );
}
