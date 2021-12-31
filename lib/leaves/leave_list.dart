// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ans/fees/fees_form.dart';
import 'package:ans/leaves/leave_form.dart';
import 'package:ans/views/Events_read.dart';
import 'package:ans/views/account.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveList extends StatefulWidget {
  const LeaveList({Key? key}) : super(key: key);

  @override
  State<LeaveList> createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  String heading = "About fee payment date extend";

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
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "status: Approve",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(DateFormat('KK:mm a').format(DateTime.now())),
                          ],
                        ),
                        trailing: Icon(
                          Icons.delete,
                        )
                        // onTap: () {

                        // },
                        ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
