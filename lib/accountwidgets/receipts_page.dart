import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 8),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, position) {
                return Column(
                  children: [
                    // User Receipt details
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 145,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20.0,
                                offset: Offset(0.0, 0.75))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Date and Receipt Number
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receipt No",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                Text(
                                  "Date:",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(
                                  height: 15,
                                ),

                                // Course and level
                                Text(
                                  "Amount:",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
