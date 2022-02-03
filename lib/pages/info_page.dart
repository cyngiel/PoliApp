import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:poli_app/calendar_utils.dart';
import 'package:translator/translator.dart';

class InfoPage extends StatefulWidget {
  State createState() => new MyAppState2();
}

class MyAppState2 extends State<InfoPage> {
  String dropdownValue = 'Polski';
  TextEditingController nameController = TextEditingController();

  final sampleUrl = 'http://www.weeia.p.lodz.pl/wgrane_pliki/21dec10.pdf';

  String? pdfFlePath;
  final translator = GoogleTranslator();
  String name = "O aplikacji";
  String title = "Jesteśmy otwarci na twoje pomysły";
  String disc =
      "Wszelkie uwagi i sugestie prosimy wysłać na adres administracja@poliapp.p.lodz.pl";

  var l = Languages().language;

  @override
  Widget build(BuildContext context) => Scaffold(

        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: FutureBuilder<String>(
            future: translator
                .translate(name, to: l)
                .then((result) => name = result.text),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return Text(name);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: ListView(children: <Widget>[
           Card(
            child: ListTile(
              //leading:  FlutterLogo(size: 56.0),
              title: FutureBuilder<String>(
                future: translator
                    .translate(title, to: l)
                    .then((result) => title = result.text),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(title);
                },
              ),
              subtitle: FutureBuilder<String>(
                future: translator
                    .translate(disc, to: l)
                    .then((result) => disc = result.text),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(disc);
                },
              ),
            ),
          ),
          Card(
              child: DropdownButton(
            value: dropdownValue,
            isExpanded: true,
            items: <String>['Polski', 'English', 'Espaniol']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                var l = Languages();
                switch (dropdownValue) {
                  case 'English':
                    l.setLanguage('en');
                    break;
                  case 'Espaniol':
                    l.setLanguage('es');
                    break;
                  case 'Polski':
                    l.setLanguage('pl');
                    break;
                  default:
                    l.setLanguage('pl');
                }
              });
            },
            elevation: 16,
            style: const TextStyle(color: Colors.deepOrange),
            underline: Container(
              height: 2,
            ),
          )),
        ]),
      );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
