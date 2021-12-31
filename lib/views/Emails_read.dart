// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class EmailReadPage extends StatefulWidget {
  const EmailReadPage({Key? key}) : super(key: key);

  @override
  State<EmailReadPage> createState() => _EmailReadPageState();
}

class _EmailReadPageState extends State<EmailReadPage> {
  String bodyMessage =
      "Dear Students i am manis gir from kathmadu nepal. I love to join in your college";
  String from = "sailesh@gmail.com";
  String title = "Urgent Meeting";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Inbox"),
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

              // From Email
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15),
                    child: Text(
                      "From: " + from,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),

              // Title is here
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 22, right: 8, left: 19),
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              // Body part is here
              Padding(
                padding: const EdgeInsets.all(2),
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
