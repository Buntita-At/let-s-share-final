import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_share/Loginfuntion/index.dart';
import 'package:lets_share/Loginfuntion/login.dart';
import 'package:lets_share/Loginfuntion/singup.dart';
import 'package:lets_share/history.dart';
import 'package:lets_share/home/home.dart';

import 'package:lets_share/spiltbill/result.dart';
import 'package:lets_share/history.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        initialRoute: '/', // Set the initial route
        routes: {
          "/": (context) => Index(),
          '/home': (context) => Home(), //
          "/history": (context) => HistoryPage(),
          "/resultpage": (context) => ResultPage("0", 0.0),
        });
  }
}
