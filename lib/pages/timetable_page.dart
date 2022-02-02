import 'dart:async';
import 'dart:io';
import 'package:poli_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

class TimetablePage extends StatefulWidget {
  State createState() => new MyAppState();
}

class MyAppState extends State<TimetablePage> {
  String dropdownValue = 'Weeia';
  TextEditingController nameController = TextEditingController();

  final sampleUrl = 'http://www.weeia.p.lodz.pl/wgrane_pliki/21dec10.pdf';

  String? pdfFlePath;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Plany zajęć'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: ListView(children: <Widget>[
/*          const Card(
            child: ListTile(
              //leading:  FlutterLogo(size: 56.0),
              title: Text('Lista placówek medycznych'),
              subtitle: Text('w których mozesz wykonać badania lekarskie'),
            ),
          ),*/
          Card(
              child: DropdownButton(
            value: dropdownValue,
            isExpanded: true,
            items: <String>['Weeia', 'Binoż', 'IFE', 'Baiś', 'Ftims', 'Mech']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            elevation: 16,
            style: const TextStyle(color: Colors.deepOrange),
            underline: Container(
              height: 2,
            ),
          )),
          Card(
              child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Kod grupy',
            ),
          )),
          Card(
              child: SizedBox(
                  //height: 300,
                  child: Column(children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        String url = '';
                        switch(dropdownValue){
                          case 'Weeia':
                            url = 'http://www.weeia.p.lodz.pl/wgrane_pliki/21dec10.pdf#search=%22grupa%22';
                            break;
                        }

                        _launchURL(url);
 /*                       loadPdf();

                        final ByteData data =
                            await rootBundle.load(pdfFlePath!);
                        List<int> documentData = data.buffer.asUint8List(
                            data.offsetInBytes, data.lengthInBytes);

                        PdfDocument document =
                            PdfDocument(inputBytes: documentData);
                        PdfTextExtractor extractor = PdfTextExtractor(document);

                        List<MatchedItem> findResult =
                            extractor.findText([nameController.text]);
                        if (findResult.length == 0) {
                          document.dispose();
                          _showResult('The text is not found');
                        }*/
                      },
                      child: const Text('Otwórz plan zajęć'),
                    ),
                    /*if (pdfFlePath != null)
                      Expanded(
                        child: Container(
                          child: PdfView(path: pdfFlePath!),
                        ),
                      )
                    else
                      Text("Pdf is not Loaded"),*/
                  ]))),
        ]),
      );

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sample.pdf');
    // if (await file.exists()) {
    //   return file.path;
    // }
    final response = await http.get(Uri.parse(sampleUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  void loadPdf() async {
    pdfFlePath = await downloadAndSavePdf();
    setState(() {});
  }

  void _showResult(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Find Text'),
            content: Scrollbar(
              child: SingleChildScrollView(
                child: Text(text),
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
              ),
            ),
            actions: [
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
