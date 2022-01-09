import 'package:ans/views/colors.dart';
import 'package:flutter/material.dart';

class SundayPage extends StatelessWidget {
  const SundayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteBackground,
      child: Column(
        children: [
          // Container for first subject
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject code
                    Text(
                      "Independent Study",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Teacher name
                    Text(
                      "08:00 AM - 10:00 AM",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                          "No Facutly",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject code
                    Text(
                      "Break",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Teacher name
                    Text(
                      "10:00 AM - 11:00 AM",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    // Time
                    Text(
                      "No Faculty",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Container for second subject
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject code
                    Text(
                      "Indepentent Study",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Teacher name
                    Text(
                      "11:00 AM - 1:00 PM",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                          "No Faculty ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
