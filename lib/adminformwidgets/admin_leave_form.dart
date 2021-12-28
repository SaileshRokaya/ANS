import 'package:flutter/material.dart';

class AdminLeaveFormPage extends StatefulWidget {
  const AdminLeaveFormPage({Key? key}) : super(key: key);

  @override
  _AdminLeaveFormPageState createState() => _AdminLeaveFormPageState();
}

class _AdminLeaveFormPageState extends State<AdminLeaveFormPage> {
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Full Name",
                        labelText: "Name",
                      ),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your college roll number",
                      labelText: "Roll Number",
                    ),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Your course name",
                        labelText: "Course",
                      ),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your college roll number",
                      labelText: "Roll Number",
                    ),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write your reason here",
                      labelText: "Reason",
                    ),
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
                    height: 20,
                  ),

                  // remark message form field is here
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 3, // when user presses enter it will adapt to it
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your remark here",
                      labelText: "Remark",
                    ),
                    //controller: passwordController,

                    // The validator receives the text that the user has entered
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Remark is required";
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
                      "Accept",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(minimumSize: Size(395, 55)),
                    onPressed: () {},
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  // Cancel button is here
                  ElevatedButton(
                    child: Text(
                      "Reject",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(minimumSize: Size(395, 55)),
                    onPressed: () {},
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
