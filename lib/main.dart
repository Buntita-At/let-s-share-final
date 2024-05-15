import 'package:flutter/material.dart';
import 'package:lets_share/Loginfuntion/index.dart';
import 'package:lets_share/activity/activity.dart';
import 'package:lets_share/groups/groups.dart';
import 'package:lets_share/home/home.dart';
import 'package:lets_share/profile/profile.dart';
import 'package:lets_share/spiltbill/result.dart';

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
          "/": (context) => const Index(),
          "/homepage": (context) => const Home(),
          "/groupspage": (context) => groups(),
          "/activitypage": (context) => activity(),
          "/profilepage": (context) => Profile(),
          "/resultpage": (context) => ResultPage("0", 0.0),
        });
  }
}
