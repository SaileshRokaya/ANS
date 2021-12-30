// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ans/fees/fees_form.dart';
import 'package:ans/leaves/leave_form.dart';
import 'package:ans/views/Events_read.dart';
import 'package:ans/views/account.dart';
import 'package:flutter/material.dart';

class LeaveList extends StatefulWidget {
  const LeaveList({Key? key}) : super(key: key);

  @override
  State<LeaveList> createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List Of Leaves Form"),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LeaveForm()));
          }),

      // The body part is here

      // favorite icon
      // IconButton(
      //   icon: Icon(_detail.isStared
      //       ? Icons.favorite
      //       : Icons.favorite_border),
      //   onPressed: () {
      //     setState(() {
      //       _detail.isStared = !_detail.isStared;
      //     });
      //   },
      // )

      // body: Container(
      //   height: height,
      //   width: width,
      //   color: Colors.white,
      //   child: ListView.builder(
      //       itemCount: 4,
      //       itemBuilder: (context, position) {
      //         return Container(
      //           child: ListTile(
      //             leading: CircleAvatar(),
      //           ),
      //         );
      //       }),
      // ),

      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, position) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: InkWell(
                    child: Container(
                      height: 80,
                      width: 420,
                      decoration: BoxDecoration(
                        //borderRadius: Radius.circular(),
                        color: Colors.black54,
                        border: Border.all(
                          color: Colors.cyan,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Decrease fee amount",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),

                                // status code is here
                                Text(
                                  "Approve",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Icon(
                                Icons.delete,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Ontap function is here
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LeaveForm()));
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
