// ignore_for_file: prefer_const_constructors

import 'package:ans/views/Events_read.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserEventPage extends StatelessWidget {
  const UserEventPage({Key? key}) : super(key: key);

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
                      height: 60,
                      width: 420,
                      decoration: BoxDecoration(
                        //borderRadius: Radius.circular(),
                        color: Colors.tealAccent.shade400,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.tealAccent,
                          width: 2,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 15, bottom: 10, right: 8),
                        // ignore: prefer_const_constructors
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Title is here",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              DateFormat('KK:mm a').format(DateTime.now()),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
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
