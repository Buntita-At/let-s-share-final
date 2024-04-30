import 'package:flutter/material.dart';
import 'package:lets_share/Loginfuntion/index.dart';
import 'package:lets_share/activity/activity.dart';
import 'package:lets_share/groups/groups.dart';
import 'package:lets_share/home/home.dart';
import 'package:lets_share/profile/profile.dart';
import 'package:lets_share/spiltbill/Spilt.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BillSplit(),
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        initialRoute: '/', // Set the initial route
        routes: {
          "/": (context) => index(),
          "/homepage": (context) => const home(),
          "/groupspage": (context) => groups(),
          "/activitypage": (context) => activity(),
          "/profilepage": (context) => Profile(),
        });
  }
}
