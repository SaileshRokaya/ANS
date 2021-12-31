import 'package:ans/admin/admin_reason_page.dart';
import 'package:flutter/material.dart';

class LeaveFeeDetail extends StatefulWidget {
  const LeaveFeeDetail({Key? key}) : super(key: key);

  @override
  _LeaveFeeDetailState createState() => _LeaveFeeDetailState();
}

class _LeaveFeeDetailState extends State<LeaveFeeDetail> {
  // Variables
  String name = "saroj";
  String formDate = "27 Dec 2021";
  String mobile = "9874382718";
  String rollNo = "200213";
  String nationality = "Nepali";
  String course = "Bsc(Hone) CSSE";
  String gender = "Male";
  String title = "Leave request for two day";
  String reason =
      "Hello sir i am not able to attend the classs for two day.I have to go my home village for some important word";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Request Information",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            // Container for user details
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      "Name:" + " " + name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Email
                    Text(
                      "Course: " + course,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Registration Date
                    Text(
                      "Date: " + formDate,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Mobile Number
                    Text(
                      "Mobile: " + mobile,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Roll No
                    Text(
                      "Roll No.: " + rollNo,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Nationality
                    Text(
                      "Nationality: " + nationality,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Course
                    Text(
                      "Course: " + course,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Gender
                    Text(
                      "Gender: " + gender,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // University id
                    Text(
                      "Title: " + title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // University id
                    Text(
                      "Reason: " + reason,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: 50,
                    ),

                    // Create row for two buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // change password button
                        ElevatedButton(
                          child: Text(
                            "Accept",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          style:
                              TextButton.styleFrom(minimumSize: Size(30, 45)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminReasonPage()));
                          },
                        ),

                        // Log out button
                        ElevatedButton(
                          child: Text(
                            "Reject",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          style:
                              TextButton.styleFrom(minimumSize: Size(30, 45)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminReasonPage()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
