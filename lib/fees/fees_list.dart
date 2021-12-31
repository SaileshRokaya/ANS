import 'package:ans/fees/fees_form.dart';
import 'package:ans/fees/reason_fee.dart';
import 'package:ans/views/Events_read.dart';
import 'package:ans/views/account.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeeList extends StatefulWidget {
  const FeeList({Key? key}) : super(key: key);

  @override
  State<FeeList> createState() => _FeeListState();
}

class _FeeListState extends State<FeeList> {
  String heading = "About fee payment date extend";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Fees"),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeesForm()));
          }),

      // The body part is here
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, position) {
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: InkWell(
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
                    child: ListTile(
                      title: Text(
                        heading,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        "status: Approve",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing:
                          Text(DateFormat('MMM d').format(DateTime.now())),
                    ),
                  ),

                  // On press function here
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeeReasonPage()));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
