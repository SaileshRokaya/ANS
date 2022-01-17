// ignore_for_file: prefer_const_constructors, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class SMSReadPage extends StatelessWidget {
  String message;
  String dates;
  String mobile;

  SMSReadPage(
      {required this.dates, required this.message, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("PCPS SMS Details"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // date time is here
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 260),
                  child: Text(
                    dates,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 22),
                  child: Text(
                    "To: " + mobile,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      padding:
                          const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                      child: Text(message,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.justify),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
