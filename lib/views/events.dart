// ignore_for_file: prefer_const_constructors

import 'package:ans/views/Events_read.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserEventPage extends StatefulWidget {
  const UserEventPage({Key? key}) : super(key: key);

  @override
  State<UserEventPage> createState() => _UserEventPageState();
}

class _UserEventPageState extends State<UserEventPage> {
  String heading = "Notice for upcoming new events on last january";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List of Events"),
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
                        color: Colors.tealAccent.shade400,
                        border: Border.all(
                          color: Colors.redAccent.shade400,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          heading,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                              builder: (context) => EventReadPage()));
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
