import 'package:ans/service/routine_service.dart';
import 'package:ans/service/subject_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoutinePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Routines"),
          centerTitle: true,
        ),
        body: FutureBuilder<List>(
            future: RoutineService().getRoutineData(),
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
                      return Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            width: 250,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // For subject name
                                Text(
                                  snapshot.data![position]["day"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Subject code
                                    Text(
                                      "Subject Name: ${snapshot.data![position]["subject_name"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                    ),

                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      (snapshot.data![position]["start_time"] +
                                          " - " +
                                          snapshot.data![position]["end_time"]),
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                Text(
                                  "Class Type: ${snapshot.data![position]["class_type"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                Text(
                                  "Room No: ${snapshot.data![position]["room_no"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
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
