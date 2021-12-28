import 'package:flutter/material.dart';

class EventReadPage extends StatelessWidget {
  const EventReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Event News"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title is here
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 22, right: 8),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    //borderRadius: Radius.circular(),
                    color: Colors.white38,
                    // border: Border.all(
                    //   color: Colors.grey,
                    //   width: 2,
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, top: 15),
                    child: Text(
                      "Notice for upcoming exams",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              // Body part is here
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    //borderRadius: Radius.circular(),
                    color: Colors.white38,
                    // border: Border.all(
                    //   color: Colors.grey,
                    //   width: 2,
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15),
                    child: Text(
                      "Hello sir i am manis gir from kathmadu nepal. I love to join in your college",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
