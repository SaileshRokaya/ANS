// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:ans/admin/admin_event_update.dart';
import 'package:ans/admin/admin_events.dart';
import 'package:ans/model/event_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/service/event_service.dart';
import 'package:ans/views/Events_read.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AdminEventListPage extends StatefulWidget {
  const AdminEventListPage({Key? key, String? title}) : super(key: key);

  @override
  _AdminEventListPageState createState() => _AdminEventListPageState();
}

class _AdminEventListPageState extends State<AdminEventListPage> {
//  EventService eventService = new EventService();

  // late final int? index;

  // Create an empty list to store the list of event coming from the database
  List<EventModel> eventDatas = [];

  // Create a method reloadData to update the UI screen
  void reloadData() async {
    final postMdl = Provider.of<EventProvider>(context, listen: false);
    eventDatas = await EventService().getEventData();
    postMdl.updateEvent(eventDatas);
  }

  // Create a method getEventUser to get all the event list
  getEventUser() async {
    // All the event list will be stored in eventDatas
    eventDatas = await EventService().getEventData();
  }

  // Create an update method to update the event title and message
  update(EventModel eventModel) async {
    // Call the updateEvent method from the class EventService to update the
    // event title and event message
    await EventService().updateEvent(eventModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Update Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

//  bool editMode = false;

  // This method will call everytime
  @override
  void initState() {
    reloadData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminEventPage()));
              }),
          appBar: AppBar(
            title: Text(
              "List Of Event",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () async {
                      List<EventModel> eventDatas =
                          await EventService().getEventData();
                      provider.updateEvent(eventDatas);
                      print("The datas are: $eventDatas");
                    },
                    child: Icon(
                      Icons.refresh_rounded,
                      size: 26.0,
                    ),
                  )),
            ],
          ),
          body: Container(

              // Check the condition whether the list is empty or not
              // if the list is empty, then it will display no data found
              // Otherwise it will display the list of events
              child: provider.eventList.isEmpty
                  ? Center(
                      child: const Text(
                      "No data found",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ))
                  : ListView.builder(

                      // itemcount will give the length of list
                      itemCount: provider.eventList.length,

                      //
                      itemBuilder: (contex, index) {
                        // We will get time and data from the database with the help of provider
                        // and will be converted in string
                        DateTime date = DateTime.parse(
                            provider.eventList[index].eventCreated.toString());
                        print("Index $index");
                        // All the event data will be added to eventGetList
                        EventModel eventGetList = eventDatas[index];
                        print("The list is $eventGetList");
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
                            title: Text(provider.eventList[index].eventTitle,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 21.0)),

                            // It will contain the data and time
                            // that coming from the data and convert in string
                            subtitle: Text(
                              DateFormat("\ndd-MM-yyyy kk:mm a")
                                  .format(date)
                                  .toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Edit icon function here
                                IconButton(
                                    onPressed: () {
                                      // After pressing the edit button the page will forward to admin event update page
                                      // with two value eventGetList which is list
                                      // Other was index
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminEventUpdatePage(
                                                      eventModel: eventGetList,
                                                      index: index)));
                                    },
                                    icon: Icon(Icons.edit)),

                                // Delete icon function here
                                IconButton(

                                    // After pressing the delete icon the respective id will be passed through the
                                    // deleteEvent method to delete the respective event data.
                                    onPressed: () async {
                                      int data = int.parse(
                                          provider.eventList[index].id);

                                      await EventService().deleteEvent(data);
                                      print("My deleteable id is: $data");

                                      // Update event method will be called with the help of provider
                                      // to update the UI screen of event list
                                      eventDatas =
                                          await EventService().getEventData();
                                      provider.updateEvent(eventDatas);
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            ),

                            // By tapping the particular card, it will show the body content of event
                            // With the help of alerdialog method
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        scrollable: true,
                                        content: Text(provider
                                            .eventList[index].eventMessage),
                                      ));
                            },
                          ),
                        );
                      })),
        );
      },
    );
  }
}
