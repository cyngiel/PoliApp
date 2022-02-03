import 'package:poli_app/pages/admin_page.dart';
import 'package:poli_app/pages/adminfaq_page.dart';
import 'package:poli_app/pages/adminfood_page.dart';
import 'package:poli_app/pages/calendar_pages/events_example.dart';
import 'package:poli_app/pages/faqs_page.dart';
import 'package:poli_app/pages/findout.dart';
import 'package:poli_app/pages/info_page.dart';
import 'package:poli_app/pages/jedzenie_page.dart';
import 'package:poli_app/pages/links_page.dart';
import 'package:poli_app/pages/login_page.dart';
import 'package:poli_app/pages/medical_page.dart';
import 'package:poli_app/pages/timetable_page.dart';
import 'package:poli_app/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import '../calendar_utils.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    final name = 'PoliApp';
    String email = 'Politechnika Lódzka';
    if(Auth().isLoggedIn){
      email = 'Panel administracyjny';
    }
    else{
      email = 'Politechnika Lódzka';
    }
/*    final urlImage =
        'https://p.lodz.pl/arch/sites/default/files/pliki/logo-pl_2.jpg';*/
    final urlImage = 'assets/logo-pl_2.jpg';
    updateCalendar();

    if(Auth().isLoggedIn){
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

                    const SizedBox(height: 12),
                    Divider(color: Colors.white70),
                    buildMenuItem(
                      text: 'Wydarzenia',
                      icon: Icons.calendar_today,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 12),
                    buildMenuItem(
                      text: 'Dodawanie wydarzenia',
                      icon: Icons.settings_applications_outlined,
                      onClicked: () => selectedItem(context, 7),
                    ),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'FAQ',
                      icon: Icons.article_outlined,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    const SizedBox(height: 12),
                    buildMenuItem(
                      text: 'Dodawanie faq',
                      icon: Icons.settings_applications_outlined,
                      onClicked: () => selectedItem(context, 10),
                    ),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Restauracje',
                      icon: Icons.food_bank_outlined,
                      onClicked: () => selectedItem(context, 11),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Dodawanie restauracji',
                      icon: Icons.settings_applications_outlined,
                      onClicked: () => selectedItem(context, 12),
                    ),

                    const SizedBox(height: 24),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 12),
                    buildMenuItem(
                      text: 'O aplikacji',
                      icon: Icons.info_outline,
                      onClicked: () => selectedItem(context, 4),
                    ),
                    const SizedBox(height: 12),
                    buildMenuItem(
                      text: 'Logowanie',
                      icon: Icons.info_outline,
                      onClicked: () => selectedItem(context, 9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }else{
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
                    const SizedBox(height: 12),
                    Divider(color: Colors.white70),
                    buildMenuItem(
                      text: 'Wydarzenia',
                      icon: Icons.calendar_today,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Plan Zajęć',
                      icon: Icons.calendar_view_day_outlined,
                      onClicked: () => selectedItem(context, 6),
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
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Restauracje',
                      icon: Icons.food_bank_outlined,
                      onClicked: () => selectedItem(context, 11),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Placówki medyczne',
                      icon: Icons.medical_services_outlined,
                      onClicked: () => selectedItem(context, 5),
                    ),
                    const SizedBox(height: 24),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 12),
                    buildMenuItem(
                      text: 'O aplikacji',
                      icon: Icons.info_outline,
                      onClicked: () => selectedItem(context, 4),
                    ),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 12),
                    buildMenuItem(
                      text: 'Administracja',
                      icon: Icons.info_outline,
                      onClicked: () => selectedItem(context, 9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }


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
    var l = Languages();

    String name = "Translating...";

//Text(text, style: TextStyle(color: color))

    if (l.language != 'pl') {
      return ListTile(
        leading: Icon(icon, color: color),
        title: FutureBuilder<String>(
          future: translator
              .translate(text, to: l.language)
              .then((result) => name = result.text),
          builder: (context, AsyncSnapshot<String> snapshot) {
            return Text(name, style: TextStyle(color: color));
          },
        ),
        hoverColor: hoverColor,
        onTap: onClicked,
      );
    } else {
      return ListTile(
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color)),
        hoverColor: hoverColor,
        onTap: onClicked,
      );
    }
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
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MedicalPage(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TimetablePage(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AdminPage(),
        ));
        break;
      case 9:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        break;
      case 10:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AdminPageFaq(),
        ));
        break;
      case 11:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EatPage(),
        ));
        break;
      case 12:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AdminPageFood(),
        ));
        break;
    }
  }
}
