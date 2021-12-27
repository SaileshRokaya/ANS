import 'package:flutter/material.dart';

class AdminEventPage extends StatefulWidget {
  const AdminEventPage({Key? key}) : super(key: key);

  @override
  _AdminEventPageState createState() => _AdminEventPageState();
}

class _AdminEventPageState extends State<AdminEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Send Events",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // container for notice title
          Padding(
            padding: const EdgeInsets.all(16.0),

            // Title content is here
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
              print("Send successfully");
            },
          ),
        ],
      ),
    );
  }
}
