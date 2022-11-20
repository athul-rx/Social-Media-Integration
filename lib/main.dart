// ignore_for_file: duplicate_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tokoto/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Home(),
  );
}
