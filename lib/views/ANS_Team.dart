import 'package:ans/model/leave_model.dart';
import "package:flutter/material.dart";

class ANS_Team extends StatefulWidget {
  final LeaveModel? leaveModel;

  const ANS_Team({Key? key, this.leaveModel}) : super(key: key);

  @override
  State<ANS_Team> createState() => _ANS_TeamState();
}

class _ANS_TeamState extends State<ANS_Team> {
  // Variables
  // String name = "";
  // String level = "";
  // String status = "";
  // String rollNo = "";
  // String course = "";
  // String reason = "";

  @override
  void initState() {
    super.initState();
    if (widget.leaveModel != null) {
      // name = widget.leaveModel!.name;
      // rollNo = widget.leaveModel!.rollNo;
      // level = widget.leaveModel!.level;
      // course = widget.leaveModel!.course;
      // reason = widget.leaveModel!.reqReason;
      // status = widget.leaveModel!.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PCPS ANS Development Team",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 20, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Intro
              Text(
                  "Quality assurance (QA) testers play a critical role in delivering high quality, perfectly-functioning software and web applications to customers. They test and evaluate new and existing programs to identify and help remove bugs, glitches, and other user experience.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 60,
              ),

              // Name
              Text(
                "Sailesh Rokaya             System Analyst",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Name
              Text(
                "Saroj Belbase                Backend Developer",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Name
              Text(
                "Kanhaiya Sharma         Frontend Developer",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              // Name
              Text(
                "Bhaskar Rokaya           QA Test Engineer",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
