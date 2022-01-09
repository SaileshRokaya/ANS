// ignore_for_file: prefer_const_constructors

import 'dart:async';
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
  EventService eventService = new EventService();

  List<EventModel> eventDatas = [];

  void reloadData() async {
    final postMdl = Provider.of<EventProvider>(context, listen: false);
    eventDatas = await EventService().getEventData();
    postMdl.updateEvent(eventDatas);
  }

  bool loading = true;

  // delete(EventModel eventModel) async {
  //   await EventService().deleteEvent(eventModel);
  //   setState(() {
  //     loading = true;
  //     // getAllEvent();
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Delete Sucessful"),
  //     ));
  //   });
  // }

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
            title: Text("API view list"),
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
              child: provider.eventList.isEmpty
                  ? Center(
                      child: const Text(
                      "No data found",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ))
                  : ListView.builder(
                      itemCount: provider.eventList.length,
                      itemBuilder: (contex, index) {
                        DateTime date = DateTime.parse(
                            provider.eventList[index].eventCreated.toString());
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          elevation: 5.0,
                          shadowColor: Colors.grey,
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 15.0,
                            ),
                            title: Text(provider.eventList[index].eventTitle,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0)),
                            subtitle: Text(
                              DateFormat("\ndd-MM-yyyy kk:mm a")
                                  .format(date)
                                  .toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                int data =
                                    int.parse(provider.eventList[index].id);

                                await EventService().deleteEvent(data);
                                print("My deleteable id is: $data");
                                eventDatas =
                                    await EventService().getEventData();
                                provider.updateEvent(eventDatas);
                                // }

                                // print("Deleted successfully");A
                                // // List<EventModel> eventDatas =
                                // //     await EventService().getEventData();
                                // // provider.updateEvent(eventDatas);
                              },
                              icon: Icon(
                                Icons.delete_forever_rounded,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      })),
        );
      },
    );

    // body: loading
    //     ? Center(
    //         child: CircularProgressIndicator(),
    //       )
    //     : ListView.builder(
    //         itemCount: eventList.length,
    //         itemBuilder: (context, index) {
    //           EventModel user = eventList[index];
    //           return ListTile(
    //             // onTap: () {
    //             //   Navigator.push(
    //             //     context,
    //             //     MaterialPageRoute(
    //             //       builder: (context) => EventReadPage(),
    //             //     ),
    //             //   );
    //             // },
    //             leading: CircleAvatar(
    //               child: Text(user.event_title[0]),
    //             ),
    //             title: Text(user.event_title),
    //             // subtitle: Text(user.event_message),
    //             // trailing: IconButton(
    //             //     icon: Icon(Icons.delete),
    //             //     onPressed: () {
    //             //       delete(user);
    //             //     }),
    //           );
    //         }),
  }
}
