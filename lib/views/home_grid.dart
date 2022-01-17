// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ans/accountwidgets/receipts_page.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/views/Emails.dart';
import 'package:ans/views/account.dart';
import 'package:ans/views/attendance.dart';
import 'package:ans/views/events.dart';
import 'package:ans/views/myroutine.dart';
import 'package:ans/views/notice.dart';
import 'package:ans/views/routine_pages.dart';
import 'package:ans/views/sms_list.dart';
import 'package:flutter/material.dart';
import 'package:ans/views/mysubject.dart';
import 'package:provider/provider.dart';

class HomeGrid extends StatefulWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  @override
  Widget build(BuildContext context) {
    //  final eventProvider = Provider.of<EventProvider>(context, listen: false);
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      children: [
        // My Suject Container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.subject,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "My Subject",
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
                MaterialPageRoute(builder: (context) => SubjectPage()));
          },
        ),

        // Routine Container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.schedule,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Routine",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RoutinePages()));
          },
        ),

        // Attendence Container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Attendence",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AttendancePage()));
          },
        ),

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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => EventView()));
          },
        ),

        // Fees Detail Container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Fees Detail",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.pink,
            ),
          ),

          // After pressing the fees detail grid it takes to the
          // account information page
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReceiptPage()));
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
                  Icons.notifications_active,
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
              color: Colors.brown,
            ),
          ),

          // On tap function is written here
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserNoticePage()));
          },
        ),

        // Email container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mark_email_unread,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blueGrey),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => EmailPage()));
          },
        ),

        // Admit card container
        InkWell(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.sms,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "SMS",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.purple,
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SMSPage()));
          },
        ),
      ],
    );
  }
}
