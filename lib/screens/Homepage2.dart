// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_typing_uninitialized_variables, unused_local_variable, unused_import, file_names, must_be_immutable, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:tokoto/screens/login.dart';

import '../services/firebase_services.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen2 extends StatefulWidget {
  String name;
  String imageUrl;
  String email;
  HomeScreen2(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.email})
      : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  var user;

  void get() {
    setState(() {
      user = FirebaseServices().userDetails!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var crossAxisAlignment;
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 2, 80),
        // backgroundColor: Colors.pink[200],
        appBar: AppBar(
          //backgroundColor: const Color.fromARGB(255, 173, 129, 63),
          backgroundColor: Color.fromARGB(255, 4, 2, 80),
          title: const Text(
            "GetInTouch",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 480,
            decoration: BoxDecoration(
              color: Color.fromARGB(46, 25, 42, 68),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                width: 1,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        //FirebaseAuth.instance.currentUser!.photoURL!
                        widget.imageUrl,
                      ),
                      radius: 36,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
                  Container(
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(widget.email,
                      style: const TextStyle(
                          //color: Color.fromARGB(255, 5, 57, 134),
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 18)),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 38,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                foregroundColor: Color.fromARGB(255, 4, 2, 80)),
                            onPressed: () async {
                              // await FirebaseServices().signOut();

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));

                              // final facebookLogin = FacebookLogin();
                              // await facebookLogin.logOut();
                              // await FirebaseAuth.instance.signOut();
                            },
                            child: const Text(
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
