import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher.dart';

class EatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Restauracje w pobliżu'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('food').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            ListView list =  ListView(
              children: snapshot.data!.docs.map((document) {
                return buildCard(document['title'], document['subtitle'], document['url'] );
              }).toList(),
            );

            return list;
          }
        }),
  );

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildCard(String title, String content, String url) => Padding(
    padding: EdgeInsets.fromLTRB(6, 12, 6, 0),
    child: Card(
      child: ListTile(
//leading:  FlutterLogo(size: 56.0),
        leading: Icon(Icons.food_bank_outlined, size: 50,),
        title:  Text(title),
        subtitle:  Text(content),
        trailing: const Icon(Icons.open_in_browser),
        onTap: () => _launchURL(url),
      ),
    ),
  );
}





