import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class UserPage extends StatelessWidget {
  late String name;
  late String urlImage;
  dynamic data;

  UserPage() {
    name = 'Aktualności';
    urlImage = 'https://p.lodz.pl/arch/sites/default/files/pliki/logo-pl_2.jpg';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(name),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
    body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('news_feed').snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
            children: snapshot.data!.docs.map((document) {
              return buildCard(document['title'], document['content'], document['url'], document['image_url']);
            }).toList(),
          );
          }
        }),
      );


  Widget buildCard(String title, String content, String url, String image_url) => Padding(
        padding: EdgeInsets.fromLTRB(6, 12, 6, 0),
        child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                Image.network(image_url),
                ExpandablePanel(
                  header: Padding(
                      padding: EdgeInsets.fromLTRB(6, 5, 6, 0),
                      child: Text(title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ))),
                  expanded: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text(content,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: ListTile(
                          //leading:  FlutterLogo(size: 56.0),
                          title: const Text('Czytaj więcej...'),
                          trailing: const Icon(Icons.open_in_browser),
                          onTap: () => _launchURL(
                              url),
                        ),
                      )
                    ],
                  ),
                  collapsed: Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: Text(content,
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ))),
                ),
              ],
            )),
      );

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
