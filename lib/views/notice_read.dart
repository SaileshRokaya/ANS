// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class NoticeReadPage extends StatefulWidget {
  const NoticeReadPage({Key? key}) : super(key: key);

  @override
  State<NoticeReadPage> createState() => _NoticeReadPageState();
}

class _NoticeReadPageState extends State<NoticeReadPage> {
  String bodyMessage =
      "Hello sir i am manis gir from kathmadu nepal. I love to join in your college";
  String title = "Admission in your college";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Event News"),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  Fluttertoast.showToast(msg: "Deleted Successfully");
                });
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // date time is here
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 188),
                child: Text(
                  DateFormat('dd-MM-yyyy, KK:mm a').format(DateTime.now()),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                      "Title: " + title,
                      maxLines: 3,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                      bodyMessage,
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
