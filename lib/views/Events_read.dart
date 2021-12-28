import 'package:flutter/material.dart';

class EventReadPage extends StatelessWidget {
  const EventReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Events"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title is here
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Dear Students, Greetings of the day! …",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),

              // Body part is here
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "adfjdfaljkdfakljadkjldakljfdakljfdkaljjl",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
