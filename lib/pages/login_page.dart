//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poli_app/calendar_utils.dart';
import 'package:poli_app/pages/user_page.dart';

import 'admin_page.dart';

class LoginPage extends StatelessWidget {
  final fieldText = TextEditingController();
  final fieldText2 = TextEditingController();
  //FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Text ("Wymagane logowanie", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),

                    SizedBox(height: 30,)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40
                  ),
                  child: Column(
                    children: [
                      //makeInput(label: "Email"),
                      //makeInput(label: "Hasło",obsureText: true),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('email',style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87
                      ),),
                      SizedBox(height: 5,),
                      TextField(
                        controller: fieldText,

                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,)

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hasło',style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87
                      ),),
                      SizedBox(height: 5,),
                      TextField(
                        controller: fieldText2,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,)

                    ],
                  )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3,left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black)
                        )
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height:60,
                      onPressed: (){
                          String email = fieldText.text;
                          String pass = fieldText2.text;

                          String _email = 'admin@p.lodz.pl';
                          String _pass = 'admin';



                          if(email == _email && pass == _pass){
                            Auth().isLoggedIn = true;

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UserPage()),
                            );

                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Zalogowano pomyślnie'),
                                //content: const Text('AlertDialog description'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );

                          }else{
                                showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Błąd logowania'),
                                //content: const Text('AlertDialog description'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }

                      },
                      color: Colors.indigoAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Text("Zaloguj",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70
                      ),),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3,left: 3),

                    child: MaterialButton(
                      minWidth: double.infinity,
                      height:30,

                      onPressed: (){
                        if(Auth().isLoggedIn){
                          Auth().isLoggedIn = false;

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserPage()),
                          );
                        }

                      },
                      color: Colors.indigoAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Text("Wyloguj",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}
