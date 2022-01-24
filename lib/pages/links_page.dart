import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Przydatne Linki'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children:  <Widget>[
            Card(
              child: ListTile(
                //leading:  FlutterLogo(size: 56.0),
                leading: Image.asset('assets/logo-pl_2.jpg', width: 50,),
                title: const Text('virTUL'),
                subtitle: const Text('Wirtualna Politechnika Łódźka'),
                trailing: const Icon(Icons.open_in_browser),
                onTap: () => _launchURL('https://virtul.p.lodz.pl/virtul/'),
              ),
            ),
            Card(
              child: ListTile(
                //leading:  FlutterLogo(size: 56.0),
                leading: Image.asset('assets/logo-pl_2.jpg', width: 50,),
                title: const Text('Samorząd Studencki'),
                subtitle: const Text('Strona główna SS:PŁ'),
                trailing: const Icon(Icons.open_in_browser),
                onTap: () => _launchURL('https://samorzad.p.lodz.pl/'),
              ),
            ),
            Card(
              child: ListTile(
                //leading:  FlutterLogo(size: 56.0),
                leading: Image.asset('assets/logo-pl_2.jpg', width: 50,),
                title: const Text('Web Dziekanat'),
                subtitle: const Text('Wirtualny Dziekanat'),
                trailing: const Icon(Icons.open_in_browser),
                onTap: () => _launchURL('https://webdziekanat.p.lodz.pl/webdziekanat/glowna.html'),
              ),
            ),

            Card(
              child: ListTile(
                //leading:  FlutterLogo(size: 56.0),
                leading: Image.asset('assets/polisocjal.png', width: 50,),
                title: const Text('PoliSocjal'),
                subtitle: const Text('Wszystko o pomocy materialnej'),
                trailing: const Icon(Icons.open_in_browser),
                onTap: () => _launchURL('https://samorzad.p.lodz.pl/polisocjal/'),
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
            Card(
              child: ListTile(
                //leading:  FlutterLogo(size: 56.0),
                leading:Image.asset('assets/logo_lodz.png', width: 50,),
                title: const Text('"Karta Łodzianina"'),
                subtitle: const Text('Załóż konto'),
                trailing: const Icon(Icons.open_in_browser),
                onTap: () => _launchURL('https://kartalodzianina.pl/n-rejestracja.qbpage'),
              ),
            ),
            Card(
              child: ListTile(
                //leading:  FlutterLogo(size: 56.0),
                leading:Image.asset('assets/logo_lodz.png', width: 50,),
                title: const Text('Migawka'),
                subtitle: const Text('Bilet okresowy'),
                trailing: const Icon(Icons.open_in_browser),
                onTap: () => _launchURL('http://www.migawka.lodz.pl/'),
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
