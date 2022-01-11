// ignore_for_file: prefer_const_constructors

import 'package:ans/views/Emails_read.dart';
import 'package:ans/views/Events_read.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  String heading = "Dear Students, Namest and warm getting from PCPS";
  String varFromEmail = "sailesh@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Inbox"),
      ),

      // The body part is here
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, position) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: InkWell(
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black12,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          heading,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        leading: CircleAvatar(
                          child: Text(varFromEmail[0]),
                        ),
                        subtitle: Text(
                          "From: " + varFromEmail,
                        ),
                        trailing:
                            Text(DateFormat("MMM d").format(DateTime.now())),
                      ),
                    ),

                    // Ontap function is here
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailReadPage()));
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
