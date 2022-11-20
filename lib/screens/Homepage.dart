// ignore_for_file: avoid_unnecessary_containers, unnecessary_import, prefer_const_constructors, prefer_typing_uninitialized_variables, implementation_imports, unused_local_variable, sized_box_for_whitespace, unused_shown_name

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';

import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        CircleAvatar,
        Colors,
        Column,
        Container,
        ElevatedButton,
        Icons,
        MaterialPageRoute,
        Navigator,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:flutter/widgets.dart';
import 'package:tokoto/screens/login.dart';
import 'package:tokoto/services/firebase_services.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get currentUser => null;

  @override
  Widget build(BuildContext context) {
    var crossAxisAlignment;
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 2, 80),
        appBar: AppBar(
          //backgroundColor: Color.fromARGB(255, 173, 129, 63),
          backgroundColor: Color.fromARGB(255, 4, 2, 80),
          title: Text(
            "GetInTouch",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 480,
            decoration: BoxDecoration(
              //color: Color.fromARGB(255, 98, 212, 244),
              //color: Color.fromARGB(255, 220, 157, 208),
              color: Color.fromARGB(90, 24, 36, 54),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                width: 0,
                // color: Color.fromARGB(255, 228, 93, 93),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //padding: EdgeInsets.only(bottom: 170),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                      radius: 36,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
                  Container(
                    child: Text(
                      "${FirebaseAuth.instance.currentUser!.displayName}",
                      style: TextStyle(
                          //color: Color.fromARGB(255, 5, 57, 134),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text("${FirebaseAuth.instance.currentUser!.email}",
                      style: TextStyle(
                          //color: Color.fromARGB(255, 5, 57, 134),
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 18)),
                  SizedBox(
                    height: 55,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          width: 130,
                          height: 38,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                //backgroundColor: Colors.orange[800]
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                foregroundColor: Color.fromARGB(255, 4, 2, 80)),
                            onPressed: () async {
                              await FirebaseServices().signOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
