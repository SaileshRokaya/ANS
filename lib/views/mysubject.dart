import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Subject"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, position) {
            return Card(
              color: Colors.green.shade400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // For subject name
                      Text(
                        "Object oriented and software engineering",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      SizedBox(
                        height: 22,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Subject code
                          Text(
                            "Unit Code: CIS019",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                          Text(
                            "Credit: 30",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
