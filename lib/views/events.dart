// ignore_for_file: prefer_is_empty

import 'dart:async';

import 'package:ans/model/event_model.dart';
import 'package:ans/service/event_service.dart';
import 'package:ans/views/Events_read.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventView extends StatefulWidget {
  const EventView({Key? key, String? title}) : super(key: key);

  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  EventService eventService = new EventService();

  //late List<EventModel> eventList;

  bool loading = true;

  // getAllEvent() async {
  //   eventList = await EventService().getEvent();
  //   print(eventList.length);
  //   setState(() {
  //     loading = false;
  //   });
  //   print("Event: ${eventList.length}");
  // }

  // delete(EventModel eventModel) async {
  //   await EventService().deleteEvent(eventModel);
  //   setState(() {
  //     loading = true;
  //     getAllEvent();
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Delete Sucessful"),
  //     ));
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getAllEvent();
    //print("The length is: ${eventList.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Event List'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EventReadPage(),
                //   ),
                // ).then((value) => getAllEvent);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder<List>(
          future: eventService.getEvent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return Center(
                  child: Text("No data available"),
                );
              }

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
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
                                  snapshot.data![index]['event_title'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                trailing: Text(
                                    DateFormat("MMM d").format(DateTime.now())),
                              ),
                            ),

                            // Ontap function is here
                            onTap: () {
                              String t1 = (snapshot.data![index]['event_title'])
                                  .toString();
                              String m1 = (snapshot.data![index]
                                      ['event_message'])
                                  .toString();
                              print(t1);
                              print('---------------------------');
                              print(m1);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EventReadPage(t1, m1)));
                              // print(snapshot.data![index]['event_title']);
                            },
                          ),
                        )
                      ],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )

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
        );
  }
}
