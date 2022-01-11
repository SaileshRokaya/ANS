// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Attendance"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                // User details
                Container(
                  height: 150,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        // Name and Course
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Name: Saroj Chhetri",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Course: Bsc CSSE",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        // roll no and level
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Roll No. 35",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Level: L5",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                // Attendance for mobile application subject
                Container(
                  height: 285,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Mobile Application",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Class Held: 45.5",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Class Attended: 37.50",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Class Absent: 20",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Projected Attendence: 92",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Total Attendence Percentage: 92%",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // Container(
                        //   height: 100,
                        //   width: 120,
                        //   decoration: BoxDecoration(
                        //     color: Colors.blueAccent,
                        //     border: Border.all(
                        //       color: Colors.black87,
                        //       width: 2,
                        //     ),
                        //   ),
                        //   child: Column(
                        //     // ignore: prefer_const_literals_to_create_immutables
                        //     children: [
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Text(
                        //         "Attendance",
                        //         style: TextStyle(
                        //             fontSize: 18, fontWeight: FontWeight.bold),
                        //       ),
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Text(
                        //         "82.42 %",
                        //         style: TextStyle(
                        //             fontSize: 18, fontWeight: FontWeight.bold),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                // Attendance for OOP and software engineering  subject
                Container(
                  height: 280,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "OOP & SE",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Class Held: 45.5",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Class Attended: 37.50",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Class Absent: 20",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Total Attendence Percentage: 92%",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Projected Attendence: 92",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // Container(
                        //   height: 100,
                        //   width: 120,
                        //   decoration: BoxDecoration(
                        //     color: Colors.blueAccent,
                        //     border: Border.all(
                        //       color: Colors.black87,
                        //       width: 2,
                        //     ),
                        //   ),
                        //   child: Column(
                        //     // ignore: prefer_const_literals_to_create_immutables
                        //     children: [
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Text(
                        //         "Attendance",
                        //         style: TextStyle(
                        //             fontSize: 18, fontWeight: FontWeight.bold),
                        //       ),
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Text(
                        //         "82.42 %",
                        //         style: TextStyle(
                        //             fontSize: 18, fontWeight: FontWeight.bold),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
