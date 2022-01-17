import 'package:ans/admin/admin_leave.dart';
import 'package:ans/model/leave_model.dart';
import 'package:ans/provider/leave_service_provider.dart';
import 'package:ans/service/leave_service.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

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

  List<LeaveModel> leaveDatas = [];

  // Create an update method with the parameter EventModel class
  update(LeaveModel leaveModel) async {
    // Call the updateEvent method from the EventService class
    // to update the event title or event message or both
    await LeaveService().updateEvent(leaveModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Update Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 12),
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

              Padding(
                padding: const EdgeInsets.only(top: 28.0, left: 60),
                child: Row(
                  children: [
                    // change password button
                    ElevatedButton(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                          minimumSize: Size(45, 45),
                          backgroundColor: Colors.green),
                      onPressed: () {
                        // Value were input on the eventmodel constructor
                        LeaveModel leaveModel = LeaveModel(
                          id: widget.leaveModel!.id,
                          name: widget.leaveModel!.name,
                          rollNo: widget.leaveModel!.rollNo,
                          reqReason: widget.leaveModel!.reqReason,
                          level: widget.leaveModel!.level,
                          leaveDate: "",
                          status: "Accept",
                          accRejReason: '',
                          course: widget.leaveModel!.course,
                        );

                        // Add method was called
                        update(leaveModel);
                        print("Update successfully");

                        // To update the UI Screen
                        void reloadData() async {
                          final postMdl = Provider.of<LeaveServiceProvider>(
                              context,
                              listen: false);
                          leaveDatas = await LeaveService().getLeaveData();
                          postMdl.updateEvent(leaveDatas);
                        }

                        reloadData();
                      },
                    ),

                    // Log out button
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        child: Text(
                          "Reject",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                            minimumSize: Size(45, 45),
                            backgroundColor: Colors.red),
                        onPressed: () {
                          // Value were input on the eventmodel constructor
                          LeaveModel leaveModel = LeaveModel(
                            id: widget.leaveModel!.id,
                            name: widget.leaveModel!.name,
                            rollNo: widget.leaveModel!.rollNo,
                            reqReason: widget.leaveModel!.reqReason,
                            level: widget.leaveModel!.level,
                            leaveDate: "",
                            status: "Reject",
                            accRejReason: '',
                            course: widget.leaveModel!.course,
                          );

                          // Add method was called
                          update(leaveModel);
                          print("Update successfully");

                          // To update the UI Screen
                          void reloadData() async {
                            final postMdl = Provider.of<LeaveServiceProvider>(
                                context,
                                listen: false);
                            leaveDatas = await LeaveService().getLeaveData();
                            postMdl.updateEvent(leaveDatas);
                          }

                          reloadData();
                        },
                      ),
                    ),
                  ],
                ),
              )

              // Course
            ],
          ),
        ),
      ),
    );
  }
}
