import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher.dart';

class FindOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: const Text('Strefa Kandydata'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: ListView(
      children:  <Widget>[
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Image.asset('assets/logo-pl_2.jpg', width: 50,),
            title: const Text('Wszystko o rekrutacji'),
            subtitle: const Text('rekrutacja.p.lodz.pl'),
            trailing: const Icon(Icons.open_in_browser),
            onTap: () => _launchURL('https://rekrutacja.p.lodz.pl/'),
          ),
        ),
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Image.asset('assets/logo-pl_2.jpg', width: 50,),
            title: const Text('Portal rekrutacyjny'),
            subtitle: const Text('e-rekrutacja'),
            trailing: const Icon(Icons.open_in_browser),
            onTap: () => _launchURL('https://e-rekrutacja.p.lodz.pl/info/'),
          ),
        ),
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Image.asset('assets/logo-pl_2.jpg', width: 50,),
            title: const Text('Studenckie Koła Naukowe'),
            subtitle: const Text('Spis wszystkich kół naukowych'),
            trailing: const Icon(Icons.open_in_browser),
            onTap: () => _launchURL('https://e-rekrutacja.p.lodz.pl/info/'),
          ),
        ),
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Icon(Icons.directions_walk, size: 50,),
            title: const Text('Wirtualny Spacer'),
            subtitle: const Text('Zdalne zwiedzanie Politechniki Łódzkiej'),
            trailing: const Icon(Icons.open_in_browser),
            onTap: () => _launchURL('https://p.lodz.pl/uczelnia/wirtualny-kampus-pl'),
          ),
        ),

        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Icon(Icons.navigation_outlined, size: 50,),
            title: const Text('Mapa'),
            subtitle: const Text('Interaktywna mapa PŁ'),
            trailing: const Icon(Icons.open_in_browser),
            onTap: () => _launchURL('https://nav.p.lodz.pl/'),
          ),
        ),
      ],
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
