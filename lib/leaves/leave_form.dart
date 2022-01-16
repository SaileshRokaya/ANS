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
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController reqReason = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController accReason = TextEditingController();

  // Create an empty list eventData to store the event data
  List<LeaveModel> eventDatas = [];

  // Add method was created
  add(LeaveModel eventModel) async {
    // Call the addEvent method from EventService class to add the data on the database
    // from the user
    await LeaveService().addLeave(eventModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Add Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        hintText: "Full Name",
                        labelText: "Name",
                      ),
                      controller: name,
                      //controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Full name is required";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        //nameController.text = value!;
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  // College roll number text is here
                  TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your college roll number",
                      labelText: "Roll Number",
                    ),
                    controller: rollno,
                    //controller: emailController,
                    // The validator receives the text that the user has entered Validation
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      }
                    },
                    onSaved: (value) {
                      //emailController.text = value!;
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
                        hintText: "Your course name",
                        labelText: "Course",
                      ),
                      controller: course,
                      //controller: phoneController,
                      // The validator receives the text that the user has entered Validation
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        //phoneController.text = value!;
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  // title text field is here
                  TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your college roll number",
                      labelText: "Level",
                    ),
                    controller: level,
                    //controller: emailController,
                    // The validator receives the text that the user has entered Validation
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                    },
                    onSaved: (value) {
                      //emailController.text = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // body message form field is here
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 5, // when user presses enter it will adapt to it
                    style: TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write your reason here",
                      labelText: "Reason",
                    ),
                    controller: reqReason,
                    //controller: passwordController,

                    // The validator receives the text that the user has entered
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Reason is required";
                      }
                    },

                    onSaved: (value) {
                      //passwordController.text = value!;
                    },
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  // Request button is here
                  ElevatedButton(
                    child: Text(
                      "Request",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                        minimumSize: Size(395, 55),
                        backgroundColor: Colors.green),
                    onPressed: () {
                      // If the user didnot input text on title form field
                      // then it will show an error with the message
                      if (name.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("This field is required"),
                        ));
                      } else {
                        // Value were input on the eventmodel constructor
                        LeaveModel leaveModel = LeaveModel(
                          id: id.text,
                          name: name.text,
                          rollNo: rollno.text,
                          reqReason: reqReason.text,
                          level: level.text,
                          leaveDate: "",
                          status: "Pending",
                          accRejReason: '',
                          course: course.text,
                        );

                        // Add method was called
                        add(leaveModel);
                        print("Added successfully");

                        // To update the UI Screen
                        void reloadData() async {
                          final postMdl = Provider.of<LeaveServiceProvider>(
                              context,
                              listen: false);
                          eventDatas = await LeaveService().getLeaveData();
                          postMdl.updateEvent(eventDatas);
                        }

                        reloadData();
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                        minimumSize: Size(395, 55),
                        backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LeaveForm()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
