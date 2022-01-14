// ignore_for_file: prefer_const_constructors

import 'package:ans/views/change_password.dart';
import 'package:ans/views/home_page.dart';
import 'package:ans/views/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    print("Token value is: $val");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCred();
  }

  @override
  Widget build(BuildContext context) {
    // Variables
    String name = "saroj";
    String email = "Saroj@gmail.com";
    String username = "27 Dec 2021";
    String mobile = "9874382718";
    String edusys_id = "200213";
    String student_id = "Nepali";

    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 100, top: 12, bottom: 12, right: 20),
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.lightBlue,
                  //backgroundImage: AssetImage("logo.png"),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Container for user details
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        "Name: " + name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Email
                      Text(
                        "Email: " + email,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Registration Date
                      Text(
                        "Username: " + username,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Mobile Number
                      Text(
                        "Mobile: " + mobile,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Roll No
                      Text(
                        "EdusysID: " + edusys_id,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Nationality
                      Text(
                        "StudentID: " + student_id,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
