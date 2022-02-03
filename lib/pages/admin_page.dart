import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poli_app/widgets/navigation_drawer_widget.dart';

class AdminPage extends StatefulWidget {
  State createState() => new MyAppState3();
}

class MyAppState3 extends State<AdminPage> {
  TextEditingController dateinput = TextEditingController();
  final fieldText = TextEditingController();
  final fieldText2 = TextEditingController();
  final fieldText3 = TextEditingController();
  DateTime date = DateTime.now();
  String name = 'nazwa';
  String description = 'opis';
  String localization = "lokalizacja";
  bool prior = false;

  CollectionReference events = FirebaseFirestore.instance.collection('calendar_events');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text("Dodawanie wydarzeń"),
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
                      labelText: "Nazwa wydarzenia" //label text of field
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
                      labelText: "Opis wydarzenia" //label text of field
                      ),
                  onChanged: (text) {
                    //print('First text field: $text');
                    description = text;
                  },
                ),
                TextField(
                  controller: fieldText2,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_fields), //icon of text field
                      labelText: "Lokalizacja wydarzenia" //label text of field
                      ),
                  onChanged: (text) {
                    //print('First text field: $text');
                    localization = text;
                  },
                ),
                TextField(
                  controller: dateinput,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Data wydarzenia" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      //print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      //print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement
                      date = pickedDate;

                      dateinput.text =
                          formattedDate; //set output date to TextField value.

                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                CheckboxListTile(
                  title: Text('Wydarzenie priorytetowe'),
                  value: prior,
                  onChanged: (value) {
                    setState(() {
                      prior = value!;
                    });
                  },
                ),
                FlatButton(
                  child: Text(
                    'Dodaj Wydarzenie',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {

                    events.add({
                      'date' : date,
                      'description': description,
                      'prior': prior,
                      'title': name,
                      'localization' : localization
                    });
                    fieldText.clear();
                    fieldText2.clear();
                    fieldText3.clear();
                    dateinput.clear();
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Dodano'),
                        //content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ), //Checkbox
              ],
            ))));
  }
}
