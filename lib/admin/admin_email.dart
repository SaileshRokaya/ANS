import 'package:flutter/material.dart';

class AdminEmailPage extends StatefulWidget {
  const AdminEmailPage({Key? key}) : super(key: key);

  @override
  _AdminEmailPageState createState() => _AdminEmailPageState();
}

class _AdminEmailPageState extends State<AdminEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Email",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: [
              TextField(
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "To",
                  //labelText: "Email",
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Subject",
                  //labelText: "Email",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
