import 'package:ans/admin/admin_email.dart';
import 'package:ans/admin/admin_events.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
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
