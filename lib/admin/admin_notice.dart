import 'package:ans/admin/admin_email.dart';
import 'package:ans/admin/admin_events.dart';
import 'package:flutter/material.dart';

class AdminNoticePage extends StatefulWidget {
  const AdminNoticePage({Key? key}) : super(key: key);

  @override
  _AdminNoticePageState createState() => _AdminNoticePageState();
}

class _AdminNoticePageState extends State<AdminNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notice"),
      ),
      body: Column(
        children: [
          // container for notice title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your title here",
                //labelText: "Email",
              ),
            ),
          ),

          // Message content is here
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1, //Normal textInputField will be displayed
              maxLines: 5, // when user presses enter it will adapt to it
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Message here",
                //labelText: "Email",
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text(
              "Send",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(minimumSize: Size(110, 55)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminEmailPage()));
              print("Send successfully");
            },
          ),
        ],
      ),
    );
  }
}
