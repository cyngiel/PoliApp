import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class FaqsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('FAQ'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: [
            buildCard(
              'Title',
              'Opis opis opis opis opis opis opis opis opis opis Opis opis opis opis opis opis opis opis opis opis Opis opis opis opis opis opis opis opis opis opis',
            ),
            buildCard(
              'Title',
              'Opis opis opis opis opis opis opis opis opis opis Opis opis opis opis opis opis opis opis opis opis Opis opis opis opis opis opis opis opis opis opis',
            ),
            buildCard(
              'Title',
              'Opis opis opis opis opis opis opis opis opis opis Opis opis opis opis opis opis opis opis opis opis Opis opis opis opis opis opis opis opis opis opis',
            )
          ],
        ),
      );

  Widget buildCard(String title, String content) => Padding(
    padding: EdgeInsets.fromLTRB(6, 12, 6, 0),
    child: Card(
      child: ExpandablePanel(
        header: Padding(
            padding: EdgeInsets.fromLTRB(6, 5, 6, 0),
            child: Text(title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ))),
      expanded: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Text(content,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ))),
      collapsed: const SizedBox.shrink(),
    )),
  );
}
