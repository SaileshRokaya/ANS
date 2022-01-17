import 'package:ans/admin/admin_leave.dart';
import 'package:ans/model/fees_model.dart';
import 'package:ans/model/leave_model.dart';
import 'package:ans/provider/fee_service_provider.dart';
import 'package:ans/provider/leave_service_provider.dart';
import 'package:ans/service/fee_form_service.dart';
import 'package:ans/service/leave_service.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class AdminFeeInformationPage extends StatefulWidget {
  final FeeModel? feeModel;

  const AdminFeeInformationPage({Key? key, this.feeModel}) : super(key: key);

  @override
  State<AdminFeeInformationPage> createState() =>
      _AdminFeeInformationPageState();
}

class _AdminFeeInformationPageState extends State<AdminFeeInformationPage> {
  // Variables
  String name = "";
  String level = "";
  String status = "";
  String rollNo = "";
  String course = "";
  String reason = "";

  List<FeeModel> feeDatas = [];

  // Create an update method with the parameter EventModel class
  update(FeeModel feeModel) async {
    // Call the updateEvent method from the EventService class
    // to update the event title or event message or both
    await FeeService().updateEvent(feeModel).then((sucess) {
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
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Email
              Text(
                "Roll No: " + rollNo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Registration Date
              Text(
                "Course: " + course,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Mobile Number
              Text(
                "Level: " + level,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Roll No
              Text(
                "Status: " + status,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),

              // Nationality
              Text(
                "Reason: " + reason,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
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
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(30, 45)),
                      onPressed: () {
                        // Value were input on the eventmodel constructor
                        FeeModel feeModel = FeeModel(
                          id: widget.feeModel!.id,
                          name: widget.feeModel!.name,
                          rollNo: widget.feeModel!.rollNo,
                          reqReason: widget.feeModel!.reqReason,
                          level: widget.feeModel!.level,
                          leaveDate: "",
                          status: "Accept",
                          accRejReason: '',
                          course: widget.feeModel!.course,
                        );

                        // Add method was called
                        update(feeModel);
                        print("Update successfully");

                        // To update the UI Screen
                        void reloadData() async {
                          final postMdl = Provider.of<FeeServiceProvider>(
                              context,
                              listen: false);
                          feeDatas = await FeeService().getfeeData();
                          postMdl.updateEvent(feeDatas);
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
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(minimumSize: Size(30, 45)),
                        onPressed: () {
                          // Value were input on the eventmodel constructor
                          FeeModel feeModel = FeeModel(
                            id: widget.feeModel!.id,
                            name: widget.feeModel!.name,
                            rollNo: widget.feeModel!.rollNo,
                            reqReason: widget.feeModel!.reqReason,
                            level: widget.feeModel!.level,
                            leaveDate: "",
                            status: "Reject",
                            accRejReason: '',
                            course: widget.feeModel!.course,
                          );

                          // Add method was called
                          update(feeModel);
                          print("Update successfully");

                          // To update the UI Screen
                          void reloadData() async {
                            final postMdl = Provider.of<FeeServiceProvider>(
                                context,
                                listen: false);
                            feeDatas = await FeeService().getfeeData();
                            postMdl.updateEvent(feeDatas);
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
