// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:ans/service/attendance_service.dart';
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
        body: FutureBuilder<List>(
            future: AttendanceService().getAttendanceData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.length == 0) {
                  return Center(
                    child: Text("No data Available"),
                  );
                }

                return ListView.builder(
                    //   itemCount: provider.receiptList.length,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, position) {
                      return Column(
                        children: [
                          // User Receipt details
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 240,
                            width: 340,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20.0,
                                      offset: Offset(0.0, 0.75))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Date and Receipt Number
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data?[position]
                                            ["subject_name"],
                                        //   provider.receiptList[position].receiptNo,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      Text(
                                        "Subject Code: " +
                                            snapshot.data?[position]
                                                ["subject_code"],
                                        //  provider.receiptList[position].receiptDate,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),

                                      // Total period
                                      Text(
                                        "Total Period: " +
                                            snapshot.data?[position]
                                                ["total_period"],
                                        //  provider.receiptList[position].totalAmount,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),

                                      // Total present
                                      Text(
                                        "Present: " +
                                            snapshot.data?[position]["present"],
                                        //  provider.receiptList[position].totalAmount,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),

                                      // Total Absent
                                      Text(
                                        "Absent: " +
                                            snapshot.data![position]["absent"],
                                        //  provider.receiptList[position].totalAmount,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
