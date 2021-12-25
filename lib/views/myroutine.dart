import 'package:ans/routinewidgets/fri.dart';
import 'package:ans/routinewidgets/mon.dart';
import 'package:ans/routinewidgets/thu.dart';
import 'package:ans/routinewidgets/tue.dart';
import 'package:ans/routinewidgets/wed.dart';
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
            )
            // body: ListView.builder(
            //     itemCount: 5,
            //     itemBuilder: (context, position) {
            //       return Card(
            //         color: Colors.grey,
            //         child: Padding(
            //           padding: const EdgeInsets.all(20.0),

            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               // For subject name
            //               Text(
            //                 "Sunday ",
            //                 style:
            //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //               ),

            //               SizedBox(
            //                 height: 15,
            //               ),

            //               // Subject code
            //               Text(
            //                 "Mobile Application ",
            //                 style:
            //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //               ),
            //               SizedBox(
            //                 height: 15,
            //               ),
            //               // Teacher name
            //               Text(
            //                 "Ajay Sharma",
            //                 style:
            //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //               ),

            //               SizedBox(
            //                 height: 15,
            //               ),
            //               // Time
            //               Text(
            //                 "08:00 - 10:00 AM",
            //                 style:
            //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //               ),

            //               SizedBox(
            //                 height: 15,
            //               ),

            //               // Teacher name
            //               Text(
            //                 "Sudhir Kumar",
            //                 style:
            //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //               ),

            //               SizedBox(
            //                 height: 15,
            //               ),
            //               // Time
            //               Text(
            //                 "12:00 - 02:00 PM",
            //                 style:
            //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //               ),
            //             ],
            //           ),
            //           // child: Text(
            //           //   position.toString(),
            //           //   style: TextStyle(fontSize: 22.0),
            //           // ),
            //         ),
            //       );
            //     }),
            ));
  }
}
