import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Badania lekarskie'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: ListView(
      children:   const <Widget>[
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            title: Text('Lista placówek medycznych'),
            subtitle: Text('w których mozesz wykonać badania lekarskie'),
          ),
        ),
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Icon(Icons.medical_services_outlined, size: 50,),
            title: Text('ADAMED'),
            subtitle: Text('ul. Paderewskiego11, tel. 42 640-37-3\nAl.Politechniki 5, tel. 42 636-84-62,'),
            //onTap: () => _launchURL('https://goo.gl/maps/deeTCUMkkwpvRyW69'),
          ),
        ),
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Icon(Icons.medical_services_outlined, size: 50,),
            title: Text('Ośrodek Medycyny Pracy'),
            subtitle: Text('ul. Aleksandrowska 61/63, tel. 42 272-18-03\nul. Tymienieckiego 18, tel. 42 279-72-80\nul. Piłsudskiego 133b, tel. 42 279-73-25'),
            //onTap: () => _launchURL('https://nav.p.lodz.pl/'),
          ),
        ),
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Icon(Icons.medical_services_outlined, size: 50,),
            title: Text('Zakład Opieki Zdrowotnej'),
            subtitle: Text('ul. Zgierska 2/8, tel. 42 659-59-59'),
            //onTap: () => _launchURL('https://nav.p.lodz.pl/'),
          ),
        ),
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Icon(Icons.medical_services_outlined, size: 50,),
            title: Text('PABIAN - MED'),
            subtitle: Text('ul. Kilińskiego 10/12, tel. 42 225-54-05'),
            //onTap: () => _launchURL('https://nav.p.lodz.pl/'),
          ),
        ),
        Card(
          child: ListTile(
            //leading:  FlutterLogo(size: 56.0),
            leading: Icon(Icons.medical_services_outlined, size: 50,),
            title: Text('AKADEMIA ZDROWIA'),
            subtitle: Text('ul. Kilińskiego 21, tel. 42 630-27-59, 731-765-649'),
            //onTap: () => _launchURL('https://nav.p.lodz.pl/'),
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
