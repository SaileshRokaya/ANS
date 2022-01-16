import 'package:ans/model/leave_model.dart';
import "package:flutter/material.dart";

class LeaveDetailPage extends StatefulWidget {
  final LeaveModel? leaveModel;

  const LeaveDetailPage({Key? key, this.leaveModel}) : super(key: key);

  @override
  State<LeaveDetailPage> createState() => _LeaveDetailPageState();
}

class _LeaveDetailPageState extends State<LeaveDetailPage> {
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
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Text(
                "Name:" + " " + name,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Email
              Text(
                "Roll No: " + rollNo,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Registration Date
              Text(
                "Course: " + course,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Mobile Number
              Text(
                "Level: " + level,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Roll No
              Text(
                "Status: " + status,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Nationality
              Text(
                "Reason: " + reason,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Course
            ],
          ),
        ),
      ),
    );
  }
}
