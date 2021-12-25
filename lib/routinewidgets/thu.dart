import 'package:flutter/material.dart';

class ThursdayPage extends StatelessWidget {
  const ThursdayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          // Container for first subject
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 460,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(
                    color: Colors.cyan,
                    width: 2,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject code
                    Text(
                      "Mobile Application ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Teacher name
                    Text(
                      "Ajay Sharma",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    // Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // subect time
                        Text(
                          "08:00 - 10:00 AM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),

                        // Room Number
                        Text(
                          "A-502",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // Container for break / lunch
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 460,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  border: Border.all(
                    color: Colors.teal,
                    width: 2,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject code
                    Text(
                      "Break",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Teacher name
                    Text(
                      "No Faculty",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    // Time
                    Text(
                      "08:00 - 10:00 AM",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Container for second subject
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 460,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  border: Border.all(
                    color: Colors.cyan,
                    width: 2,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject code
                    Text(
                      "Mobile Application ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Teacher name
                    Text(
                      "Ajay Sharma",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    // Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // subect time
                        Text(
                          "08:00 - 10:00 AM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),

                        // Room Number
                        Text(
                          "A-502",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
