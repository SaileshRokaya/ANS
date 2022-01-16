// ignore_for_file: prefer_const_constructors, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class EmailReadPage extends StatelessWidget {
  String message;
  String title;
  String dates;
  String emailFrom;

  EmailReadPage(
      {required this.dates,
      required this.message,
      required this.title,
      required this.emailFrom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Information"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // date time is here
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 250),
                  child: Text(
                    dates,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 19),
                  child: Text(
                    "From: " + emailFrom,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                // Title is here
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 22, right: 8, left: 19),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      //borderRadius: Radius.circular(),
                      color: Colors.white38,
                      // border: Border.all(
                      //   color: Colors.grey,
                      //   width: 2,
                      // ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, top: 15),
                      child: Text(
                        "Subject: " + title,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                // Body part is here
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      //borderRadius: Radius.circular(),
                      color: Colors.white38,
                      // border: Border.all(
                      //   color: Colors.grey,
                      //   width: 2,
                      // ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: Text(
                        message,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
