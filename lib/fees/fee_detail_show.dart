import 'package:ans/model/fees_model.dart';
import 'package:ans/model/leave_model.dart';
import "package:flutter/material.dart";

class FeeDetailPage extends StatefulWidget {
  final FeeModel? feeModel;

  const FeeDetailPage({Key? key, this.feeModel}) : super(key: key);

  @override
  State<FeeDetailPage> createState() => _FeeDetailPageState();
}

class _FeeDetailPageState extends State<FeeDetailPage> {
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
    if (widget.feeModel != null) {
      name = widget.feeModel!.name;
      rollNo = widget.feeModel!.rollNo;
      level = widget.feeModel!.level;
      course = widget.feeModel!.course;
      reason = widget.feeModel!.reqReason;
      status = widget.feeModel!.status;
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
