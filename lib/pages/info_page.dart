import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:poli_app/calendar_utils.dart';

class InfoPage extends StatefulWidget {
  State createState() => new MyAppState2();
}

class MyAppState2 extends State<InfoPage> {
  String dropdownValue = 'Zmień język';
  TextEditingController nameController = TextEditingController();
  var l = Languages();

  final sampleUrl = 'http://www.weeia.p.lodz.pl/wgrane_pliki/21dec10.pdf';

  String? pdfFlePath;

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: const Text('O Aplikacji'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),

    body: ListView(children: <Widget>[
         const Card(
            child: ListTile(
              //leading:  FlutterLogo(size: 56.0),
              title: Text('Jesteśmy otwarci na twoje pomysły'),
              subtitle: Text('Wszelkie uwagi i sugestie prosimy wysłać na adres administracja@poliapp.p.lodz.pl'),
            ),
          ),
      Card(
          child: DropdownButton(
            value: dropdownValue,
            isExpanded: true,
            items: <String>['Zmień język', 'Polski', 'English', 'Espaniol']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                switch(dropdownValue){
                  case 'English': l.language = 'en';
                  break;
                  case 'Espaniol': l.language = 'es';
                  break;
                  default: l.language = 'pl';
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
