import 'package:ans/routinewidgets/fri.dart';
import 'package:ans/routinewidgets/mon.dart';
import 'package:ans/routinewidgets/thu.dart';
import 'package:ans/routinewidgets/tue.dart';
import 'package:ans/routinewidgets/wed.dart';
import 'package:ans/views/colors.dart';
import 'package:flutter/material.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Routine"),
              centerTitle: true,

              // bottom
              bottom: TabBar(tabs: [
                Tab(
                  text: "Mon",
                ),
                Tab(
                  text: "Tue",
                ),
                Tab(
                  text: "Wed",
                ),
                Tab(
                  text: "Thu",
                ),
                Tab(
                  text: "Fri",
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                MondayPage(),
                TuesdayPage(),
                WednesdayPage(),
                ThursdayPage(),
                FridayPage(),
              ],
            )));
  }
}
