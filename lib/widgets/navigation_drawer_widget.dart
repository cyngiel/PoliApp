import 'package:poli_app/pages/calendar_pages/events_example.dart';
import 'package:poli_app/pages/faqs_page.dart';
import 'package:poli_app/pages/findout.dart';
import 'package:poli_app/pages/info_page.dart';
import 'package:poli_app/pages/links_page.dart';
import 'package:poli_app/pages/user_page.dart';
import 'package:flutter/material.dart';

import '../calendar_utils.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = 'PoliApp';
    final email = 'Politechnika Lódzka';
/*    final urlImage =
        'https://p.lodz.pl/arch/sites/default/files/pliki/logo-pl_2.jpg';*/
    final urlImage = 'assets/logo-pl_2.jpg';
    updateCalendar();
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(color: Colors.white70),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'Strefa Kandydata',
                    icon: Icons.wifi_tethering,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Wydarzenia',
                    icon: Icons.calendar_today,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'FAQ',
                    icon: Icons.article_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Przydatne linki',
                    icon: Icons.link,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),

                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'O aplikacji',
                    icon: Icons.info_outline,
                    onClicked: () => selectedItem(context, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              //CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              CircleAvatar(radius: 30, backgroundImage: AssetImage(urlImage)),

              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TableEventsExample(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FaqsPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LinksPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FindOut(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InfoPage(),
        ));
        break;
    }
  }
}
