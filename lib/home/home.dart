import 'dart:html';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lets_share/Loginfuntion/singup.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        bottomNavigationBar: GNav(
            backgroundColor: Color.fromARGB(255, 243, 201, 215),
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 243, 158, 186),
            color: Colors.black,
            gap: 8,
            padding: EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "HOME",
              ),
              GButton(
                icon: Icons.people,
                text: "GROUP",
              ),
              GButton(
                icon: Icons.add,
                text: "ADD",
              ),
              GButton(
                icon: Icons.home,
                text: "ACTIVITY",
              ),
              GButton(
                icon: Icons.person_outlined,
                text: "PROFILE",
              ),
            ]),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Text(
                            "Over all,you owed THB 50.00 ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/fuji.png",
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Fuji",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("owes you 25.00 THB.")
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/mori.png",
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mori",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("owes you 25.00 THB.")
                                  ],
                                )),
                          ],
                        ),
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1200),
                          child: Text(
                            "No one paid you !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15),
                          )),
                    ],
                  ),
                ]),
          ),
        ),
      );
    }
  }
}
