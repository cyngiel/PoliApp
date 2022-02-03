import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poli_app/widgets/navigation_drawer_widget.dart';

class AdminPageFaq extends StatefulWidget {
  State createState() => new MyAppState4();
}

class MyAppState4 extends State<AdminPageFaq> {
  TextEditingController dateinput = TextEditingController();
  final fieldText = TextEditingController();
  final fieldText2 = TextEditingController();
  final fieldText3 = TextEditingController();
  DateTime date = DateTime.now();
  String name = 'nazwa';
  String description = 'opis';
  String localization = "lokalizacja";
  bool prior = false;

  CollectionReference events = FirebaseFirestore.instance.collection('faq');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text("Dodawanie FAQ"),
          backgroundColor: Colors.redAccent, //background color of app bar
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            height: 1000,
            child: Center(
                child: Column(
                  children: [
                    TextField(
                      controller: fieldText,
                      decoration: InputDecoration(
                          icon: Icon(Icons.text_fields), //icon of text field
                          labelText: "Pytanie" //label text of field
                      ),
                      onChanged: (text) {
                        //print('First text field: $text');
                        name = text;
                      },
                    ),
                    TextField(
                      controller: fieldText3,
                      decoration: InputDecoration(
                          icon: Icon(Icons.text_fields), //icon of text field
                          labelText: "Opis" //label text of field
                      ),
                      onChanged: (text) {
                        //print('First text field: $text');
                        description = text;
                      },
                    ),

                    FlatButton(
                      child: Text(
                        'Dodaj',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {

                        events.add({
                          'title' : name,
                          'content': description,
                        });
                        fieldText.clear();
                        fieldText2.clear();
                        fieldText3.clear();

                      },
                    ), //Checkbox
                  ],
                ))));
  }
}
