import 'package:ans/admin/admin_leave.dart';
import 'package:ans/model/leave_model.dart';
import "package:flutter/material.dart";

class AdminLeaveInformationPage extends StatefulWidget {
  final LeaveModel? leaveModel;

  const AdminLeaveInformationPage({Key? key, this.leaveModel})
      : super(key: key);

  @override
  State<AdminLeaveInformationPage> createState() =>
      _AdminLeaveInformationPageState();
}

class _AdminLeaveInformationPageState extends State<AdminLeaveInformationPage> {
  // Variables
  String name = "";
  String level = "";
  String status = "";
  String rollNo = "";
  String course = "";
  String reason = "";

  @override
  void initState() {
    super.initState();
    if (widget.leaveModel != null) {
      name = widget.leaveModel!.name;
      rollNo = widget.leaveModel!.rollNo;
      level = widget.leaveModel!.level;
      course = widget.leaveModel!.course;
      reason = widget.leaveModel!.reqReason;
      status = widget.leaveModel!.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Information",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              // Name
              Text(
                "Name:" + " " + name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Email
              Text(
                "Roll No: " + rollNo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Registration Date
              Text(
                "Course: " + course,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Mobile Number
              Text(
                "Level: " + level,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Roll No
              Text(
                "Status: " + status,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Nationality
              Text(
                "Reason: " + reason,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // change password button
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: ElevatedButton(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(30, 45)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminLeavePage()));
                      },
                    ),
                  ),

                  // Log out button
                  ElevatedButton(
                    child: Text(
                      "Reject",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(minimumSize: Size(30, 45)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminLeavePage()));
                    },
                  ),
                ],
              )

              // Course
            ],
          ),
        ),
      ),
    );
  }
}
