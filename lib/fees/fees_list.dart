// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ans/fees/fee_detail_show.dart';
import 'package:ans/fees/fees_update_form.dart';
import 'package:ans/leaves/leave_form.dart';
import 'package:ans/model/fees_model.dart';
import 'package:ans/provider/fee_service_provider.dart';
import 'package:ans/service/fee_form_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeeList extends StatefulWidget {
  const FeeList({Key? key}) : super(key: key);

  @override
  State<FeeList> createState() => _FeeListState();
}

class _FeeListState extends State<FeeList> {
  // Create an empty list to store the list of event coming from the database
  List<FeeModel>? feeDatas;

  // Create a method reloadData to update the UI screen
  void reloadData() async {
    final postMdl = Provider.of<FeeServiceProvider>(context, listen: false);
    feeDatas = await FeeService().getfeeData();
    postMdl.updateEvent(feeDatas!);
  }

  // Create a method user form status
  void checkStatus() {
    final postMdl = Provider.of<FeeServiceProvider>(context, listen: false);
  }

  // Create a method getEventUser to get all the event list
  getEventUser() async {
    // All the event list will be stored in eventDatas
    feeDatas = await FeeService().getfeeData();
  }

  // Create an update method to update the event title and message
  update(FeeModel feeModel) async {
    // Call the updateEvent method from the class EventService to update the
    // event title and event message
    await FeeService().updateEvent(feeModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Update Sucessful"),
      ));
      // print("Add Sucessful");
      //Navigator.pop(context);
    });
  }

  String heading = "About fee payment date extend";

  // This method will call everytime
  @override
  void initState() {
    reloadData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<FeeServiceProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("List Of Fees Form"),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LeaveForm()));
              }),

          // The body part is here
          body: Container(
            // Check the condition whether the list is empty or not
            // if the list is empty, then it will display no data found
            // Otherwise it will display the list of events
            child: provider.feeList.isEmpty
                ? Center(
                    child: const Text(
                    "No data found",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ))
                : ListView.builder(
                    itemCount: provider.feeList.length,
                    itemBuilder: (context, position) {
                      // All the event data will be added to eventGetList
                      //  EventModel eventGetList = eventDatas![index];
                      //  print("The list is $eventGetList");
                      Map<String, dynamic> data = {
                        "id": provider.feeList[position].id,
                        "name": provider.feeList[position].name,
                        "course": provider.feeList[position].course,
                        "level": provider.feeList[position].level,
                        "roll_no": provider.feeList[position].rollNo,
                        "leave_date": provider.feeList[position].leaveDate,
                        "status": provider.feeList[position].status,
                        "req_reason": provider.feeList[position].reqReason,
                        "acc_rej_reason":
                            provider.feeList[position].accRejReason
                      };
                      int ids = int.parse(provider.feeList[position].id);
                      print("The updated id is: $ids");

                      FeeModel model = FeeModel.fromJson(data);

                      return Card(
                        margin: EdgeInsets.all(8.0),
                        elevation: 5.0,
                        shadowColor: Colors.grey,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),

                          // It contain the title of the event coming from the database
                          // with the help of provider
                          title: Text(provider.feeList[position].name,
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 18.0)),
                          leading: CircleAvatar(
                            child: Text(provider.feeList[position].name[0]),
                          ),

                          // It will contain the data and time
                          // that coming from the data and convert in string
                          subtitle: Text(
                            provider.feeList[position].status,
                            // Text(
                            //   DateFormat("\ndd-MM-yyyy kk:mm a")
                            //       .format(date)
                            //       .toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Edit icon function here
                              IconButton(
                                  onPressed: () {
                                    if (provider.feeList[position].status ==
                                            "Accept" ||
                                        provider.feeList[position].status ==
                                            "Reject") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Cannot change the status")));
                                    } else {
                                      // After pressing the edit button the page will forward to admin event update page
                                      // with two value eventGetList which is list
                                      // Other was index
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FeesUpdateForm(
                                                    feeModel: model,
                                                  )));
                                    }
                                  },
                                  icon: Icon(Icons.edit)),

                              // Delete icon function here
                              IconButton(

                                  // After pressing the delete icon the respective id will be passed through the
                                  // deleteEvent method to delete the respective event data.
                                  onPressed: () async {
                                    int data = int.parse(
                                        provider.feeList[position].id);

                                    await FeeService().deleteEvent(data);
                                    print("My deleteable id is: $data");

                                    //   Update event method will be called with the help of provider
                                    //   to update the UI screen of event list
                                    feeDatas = await FeeService().getfeeData();
                                    provider.updateEvent(feeDatas!);
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          ),

                          // By tapping the particular card, it will show the body content of event
                          // With the help of alerdialog method
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeeDetailPage(
                                          feeModel: model,
                                        )));
                          },
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
