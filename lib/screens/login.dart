// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:tokoto/screens/Homepage.dart';
import 'package:tokoto/screens/Homepage2.dart';

import '../services/firebase_services.dart';

class Login extends StatefulWidget {
  Map? _userData;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 4, 2, 80),
        title: Text("Login"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/LOGIN.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: 90),
            Container(
              width: 320,
              margin: EdgeInsets.only(),
              child: Image(
                image: AssetImage('assets/images/media.png'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 25),
              width: 305,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800], elevation: 3),
                onPressed: () async {
                  var details = await FirebaseServices().signInWithFacebook();
                  print(details);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen2(
                              name: details['name'],
                              imageUrl: details['picture']['data']['url'],
                              email: details['email'])));
                },
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 15),
                    Container(
                      child: Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Login with Facebook",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Color.fromARGB(255, 255, 255, 255),
                      thickness: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color.fromARGB(255, 255, 255, 255),
                      thickness: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 0),
              width: 305,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 230, 234, 237),
                    elevation: 3),
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 15),
                    Container(
                      height: 24,
                      child: Image(
                        image: AssetImage('assets/images/g1.png'),
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Sign In with Google",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult =
        await FacebookAuth.instance.login(permissions: [
      'email',
      'public_profile',
    ]);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
