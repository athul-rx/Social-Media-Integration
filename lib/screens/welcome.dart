// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tokoto/screens/login.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 120,
          ),
          Container(
            width: 270,
            height: 270,
            child: Image(
              image: AssetImage('assets/images/media.png'),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // ignore: prefer_const_constructors
          Text(
            "Hola Coder!",
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 33),
          ),
          SizedBox(
            height: 170,
          ),
          Container(
            height: 47,
            width: 260,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              child: Text(
                "Continue",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: Color.fromARGB(255, 22, 26, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "Designed by ATHUL R",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
