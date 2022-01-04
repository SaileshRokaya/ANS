// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ans/admin/admin_event_list.dart';
import 'package:ans/admin/admin_events.dart';
import 'package:ans/admin/admin_fees.dart';
import 'package:ans/admin/admin_leave.dart';
import 'package:ans/admin/admin_notice.dart';
import 'package:ans/admin/admin_notice_list.dart';
import 'package:ans/views/account.dart';
import 'package:ans/views/attendance.dart';
import 'package:ans/views/events.dart';
import 'package:ans/views/myroutine.dart';
import 'package:flutter/material.dart';
import 'package:ans/views/mysubject.dart';

class AdminGrid extends StatefulWidget {
  const AdminGrid({Key? key}) : super(key: key);

  @override
  State<AdminGrid> createState() => _AdminGridState();
}

class _AdminGridState extends State<AdminGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      children: [
        // Events container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.book,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Events",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.teal,
            ),
          ),

          // Ontap function is here
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminEventListPage()));
          },
        ),

        // Notice container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.notifications,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Notice",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey,
            ),
          ),

          // Ontap function is here
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminNoticeListPage()));
          },
        ),

        // Leave Request  container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.money,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Leave",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.green,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminLeavePage()));
          },
        ),

        // Fees Request container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.book,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Fees",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.green,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminFeePage()));
          },
        ),
      ],
    );
  }
}
