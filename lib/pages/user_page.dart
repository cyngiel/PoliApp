import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  const UserPage.noArgs({
    Key? key,
  })
      : name = 'Aktualności',
        urlImage = 'https://p.lodz.pl/arch/sites/default/files/pliki/logo-pl_2.jpg',
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Aktualności'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: [
            buildCard(
              'Rekrutacja na studia II st',
              'W rekrutacji zimowej Politechnika Łódzka przygotowała bogatą ofertę kształcenia na 35 kierunkach, w tym sześciu prowadzonych w języku angielskim. 1535 miejsc czeka na kandydatów na studiach stacjonarnych oraz 60 na niestacjonarnych. Aby zapoznać się z uczelnią zapraszamy na wirtualny spacer po pięknym 35 hektarowym kampusie, znajdującym się w centrum miasta. Podczas zwiedzania można zajrzeć do niektórych nowoczesnych budynków i laboratoriów.',
              'https://rekrutacja.p.lodz.pl/sites/default/files/styles/large/public/dsc_2403.jpg?itok=jthOFDGN',
            ),

          ],
        ),
      );

  Widget buildCard(String title, String content, String url) =>
      Padding(
        padding: EdgeInsets.fromLTRB(6, 12, 6, 0),
        child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                Image.network(url),
                ExpandablePanel(
                  header: Padding(
                      padding: EdgeInsets.fromLTRB(6, 5, 6, 0),
                      child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ))),
                  expanded: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text(
                            content,
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
                            onTap: () =>
                                _launchURL(
                                    'https://p.lodz.pl/uczelnia/aktualnosci/z-koncem-stycznia-ruszy-rekrutacja-na-studia-ii-stopnia-w-pl'),
                          ),
                      )
                    ],
                  ),
                  collapsed: Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: Text(
                          content,
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ))),
                ),
              ],
            )
        ),
      );

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}