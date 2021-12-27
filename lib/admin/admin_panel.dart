// ignore_for_file: prefer_const_constructors

import 'package:ans/admin/admin_grid.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //MenuBarPage(),
            Padding(
              padding: const EdgeInsets.only(right: 75),
              child: Text("Admin Panel",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            InkWell(
              child: Icon(Icons.logout),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminHomePage()));
                print("Log out successfully");
              },
            ),
          ],
        ),
      ),

      // Body part of the admin panel here
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(10.0),

            // Call admin grid method to show grid view of the admin page
            child: AdminGrid()),
      ),
    );
  }
}
