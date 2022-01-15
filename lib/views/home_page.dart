// ignore_for_file: prefer_const_constructors

import 'package:ans/views/login.dart';
import 'package:ans/views/menu_bar.dart';
import 'package:ans/views/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:ans/views/mysubject.dart';
import 'package:ans/views/home_grid.dart';
import 'package:ans/views/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBarPage(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //MenuBarPage(),
            Padding(
              padding: const EdgeInsets.only(right: 75),
              child: Title(color: Colors.blue, child: Text("DASHBOARD")),
            ),
            InkWell(
              child: CircleAvatar(
                //backgroundImage: AssetImage("logo.png"),
                radius: 22.0,
                backgroundColor: Colors.cyanAccent,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
            )
          ],
        ),
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(10.0),

            // Call home grid method to show grid view of the home page
            child: HomeGrid()),
      ),
    );
  }
}
