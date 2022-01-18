// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:ans/provider/user_provider.dart';
import 'package:ans/service/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:ans/model/user_model.dart';
import 'package:ans/views/home_page.dart';
import 'package:ans/views/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetail extends StatelessWidget {
  String username;
  String password;
  UserDetail({required this.username, required this.password});

  // Login? logins;
  @override
  Widget build(BuildContext context) {
    // var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
            future: UserService().getUserData(username, password),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.length == 0) {
                  return Center(
                    child: Text("No data Available"),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 75, top: 12, bottom: 12, right: 20),
                        child: CircleAvatar(
                          child: Text(
                            (snapshot.data?['data']['name'])[0],
                            style: TextStyle(fontSize: 75),
                          ),
                          radius: 75,
                          // backgroundColor: Colors.lightBlue,
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
                                "Name: " + snapshot.data?['data']['name'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              // Email
                              Text(
                                "Email: " + snapshot.data?['data']['email'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              // Registration Date
                              Text(
                                "Username: " +
                                    snapshot.data?['data']['username'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              // Mobile Number
                              Text(
                                "Mobile: " +
                                    snapshot.data?['data']['mobile_no'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              // Roll No
                              Text(
                                "EdusysID: " +
                                    (snapshot.data?['data']['edusys_id'])
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              // Nationality
                              Text(
                                "StudentID: " +
                                    (snapshot.data?['data']['student_id'])
                                        .toString(),
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
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
