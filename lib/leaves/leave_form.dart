import 'package:ans/leaves/leave_list.dart';
import 'package:ans/model/leave_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/provider/leave_service_provider.dart';
import 'package:ans/service/leave_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaveForm extends StatefulWidget {
  final LeaveModel? leaveModel;
  const LeaveForm({Key? key, this.leaveModel}) : super(key: key);

  @override
  _LeaveFormState createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  late LeaveModel leaveModels;
  TextEditingController id = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController applicationDate = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController remarks = TextEditingController();

  // Create an empty list eventData to store the event data
  List<LeaveModel> eventDatas = [];

  add(LeaveModel leaveModel) async {
    // Call the addEvent method from EventService class to add the data on the database
    // from the user
    await LeaveService().addLeave(leaveModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Add Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LeaveServiceProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Leave Request Form"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Subject ",
                          labelText: "Title",
                        ),
                        controller: subject,
                        //controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          LeaveServiceProvider().Subject = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // College roll number text is here
                      TextFormField(
                        style: TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Your message here",
                          labelText: "Message",
                        ),
                        controller: message,
                        //controller: emailController,
                        // The validator receives the text that the user has entered Validation
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your message";
                          }
                        },
                        onChanged: (String value) {
                          LeaveServiceProvider().Message = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Course name text field is here
                      TextFormField(
                        style: TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Your application date here",
                          labelText: "Application Date",
                        ),
                        controller: applicationDate,
                        //controller: phoneController,
                        // The validator receives the text that the user has entered Validation
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          LeaveServiceProvider().ApplicationDate = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // title text field is here
                      TextFormField(
                        style: TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your leave start date",
                          labelText: "Start Date",
                        ),
                        controller: startDate,
                        //controller: emailController,
                        // The validator receives the text that the user has entered Validation
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                        },
                        onChanged: (String value) {
                          LeaveServiceProvider().LeaveStartDate = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // body message form field is here
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1, //Normal textInputField will be displayed
                        maxLines:
                            5, // when user presses enter it will adapt to it
                        style: TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your end date",
                          labelText: "End Date",
                        ),
                        controller: endDate,
                        //controller: passwordController,

                        // The validator receives the text that the user has entered
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Reason is required";
                          }
                        },

                        onChanged: (String value) {
                          LeaveServiceProvider().LeaveEndDate = value;
                        },
                      ),

                      SizedBox(
                        height: 50,
                      ),

                      // Request button is here
                      ElevatedButton(
                        child: Text(
                          "Request",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                            minimumSize: Size(395, 55),
                            backgroundColor: Colors.green),
                        onPressed: () {
                          // If the user didnot input text on title form field
                          // then it will show an error with the message
                          if (subject.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("This field is required"),
                            ));
                          } else {
                            final data = Provider.of<LeaveServiceProvider>(
                                context,
                                listen: false);
                            LeaveModel model = LeaveModel(
                                id: 0,
                                subject: subject.text,
                                message: message.text,
                                applicationDate: applicationDate.text,
                                leaveStartDate: startDate.text,
                                leaveEndDate: endDate.text,
                                status: status.text,
                                approverRemarks: remarks.text);

                            add(model);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LeaveList()));

                          }
                        },
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      // Cancel button is here
                      ElevatedButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                            minimumSize: Size(395, 55),
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LeaveForm()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
