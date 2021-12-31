import 'package:ans/admin/admin_panel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminReasonPage extends StatefulWidget {
  const AdminReasonPage({Key? key}) : super(key: key);

  @override
  _AdminReasonPageState createState() => _AdminReasonPageState();
}

class _AdminReasonPageState extends State<AdminReasonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Reason Page",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // Text here
            Text(
              "Write your reason here !!!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 15,
            ),
            // Reason field is here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 15, // when user presses enter it will adapt to it
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
            ),

            // Send Button
            ElevatedButton(
              child: Text(
                "Send",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(minimumSize: Size(30, 45)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminHomePage()));

                Fluttertoast.showToast(
                    msg: "Your request sent successfully", fontSize: 18);
              },
            ),
          ],
        ),
      ),
    );
  }
}
