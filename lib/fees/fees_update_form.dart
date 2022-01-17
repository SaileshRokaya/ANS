import 'package:ans/model/fees_model.dart';
import 'package:ans/model/leave_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/provider/fee_service_provider.dart';
import 'package:ans/provider/leave_service_provider.dart';
import 'package:ans/service/fee_form_service.dart';
import 'package:ans/service/leave_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeesUpdateForm extends StatefulWidget {
  final FeeModel? feeModel;
  const FeesUpdateForm({Key? key, this.feeModel}) : super(key: key);

  @override
  _FeesUpdateFormState createState() => _FeesUpdateFormState();
}

class _FeesUpdateFormState extends State<FeesUpdateForm> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController reqReason = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController accReason = TextEditingController();

  // Create an empty list eventData to store the event data
  List<FeeModel> feeDatas = [];

  // Add method was created
  add(FeeModel feeModel) async {
    // Call the addEvent method from EventService class to add the data on the database
    // from the user
    await FeeService().addFees(feeModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Add Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

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
      name.text = widget.feeModel!.name;
      rollno.text = widget.feeModel!.rollNo;
      level.text = widget.feeModel!.level;
      course.text = widget.feeModel!.course;
      reqReason.text = widget.feeModel!.reqReason;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Fee Request Form"),
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
                      // enabled: false,
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
                    height: 30,
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
                      "Update",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                        minimumSize: Size(395, 55),
                        backgroundColor: Colors.lightGreen),
                    onPressed: () {
                      // If the user didnot input text on title form field
                      // then it will show an error with the message
                      if (name.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("This field is required"),
                        ));
                      } else {
                        // Value were input on the eventmodel constructor
                        FeeModel feeModel = FeeModel(
                          id: widget.feeModel!.id,
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
                      }
                    },
                  ),

                  SizedBox(
                    height: 30,
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
