import 'package:flutter/material.dart';

class LeaveReasonPage extends StatelessWidget {
  const LeaveReasonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String reason =
        "We are sorry to say that your application request for fee reduction was denied";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
          child: Container(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.tealAccent.shade400,
                border: Border.all(
                  color: Colors.redAccent.shade400,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  reason,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              )),
        ),
      ),
    );
  }
}
