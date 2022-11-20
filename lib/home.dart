// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, duplicate_import, override_on_non_overriding_member

import 'package:flutter/material.dart';

import 'package:tokoto/screens/welcome.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GetInTouch",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/LOGIN.jpg'),
                fit: BoxFit.cover),
          ),
          child: ListView(
            children: [
              Welcome(),
            ],
          ),
        ),
      ),
    );
  }
}
