import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class FaqsPage extends StatelessWidget {
  final fieldText = TextEditingController();
  final fieldText2 = TextEditingController();
  CollectionReference events = FirebaseFirestore.instance.collection('faq');

  String title = 'title';
  String desc = 'desc';

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('FAQ'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body:
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection('faq').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  ListView list =  ListView(
                    children: snapshot.data!.docs.map((document) {
                      return buildCard(document['title'], document['content']);
                    }).toList(),
                  );

                  return list;
                }
              }),


      );

  Widget buildCard(String title, String content) => Padding(
        padding: EdgeInsets.fromLTRB(6, 12, 6, 0),
        child: Card(
            child: ExpandablePanel(
          header: Padding(
              padding: EdgeInsets.fromLTRB(6, 5, 6, 0),
              child: Text(title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))),
          expanded: Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(content,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ))),
          collapsed: const SizedBox.shrink(),
        )),
      );
}
