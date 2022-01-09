// ignore_for_file: prefer_is_empty, prefer_const_constructors

import 'dart:async';

import 'package:ans/model/event_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/service/event_service.dart';
import 'package:ans/views/Events_read.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //final eventProvider = Provider.of<EventService>(context, listen: false);
  //   //getAllEvent();
  //   //print("The length is: ${eventList.length}");
  //   final postEvent = Provider.of<EventProvider>(context, listen: false);
  //   postEvent.getPostData(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(CupertinoIcons.refresh_thick),
              onPressed: () async {
                List<EventModel> eventDatas =
                    await EventService().getEventData();
                provider.updateEvent(eventDatas);
                print("The datas are: $eventDatas");
              }),
          appBar: AppBar(
            title: Text("API view list"),
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
                            // subtitle:
                            //     Text(provider.eventList[index].eventCreated),
                            subtitle: Text(
                              DateFormat("\ndd-MM-yyyy kk:mm a")
                                  .format(date)
                                  .toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      })),
        );
      },
    );
    //final postEvent = Provider.of<EventProvider>(context);
    // return
    // MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider()),
    //     ],
    //   child:
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text('Event List'),
    //     ),
    //     body: FutureBuilder<dynamic>(
    //       future: eventService.getEvent(),
    //       // future: postEvent.eventData,
    //       // stream: postEvent.eventData,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           if (snapshot.data!.length == 0) {
    //             return Center(
    //               child: Text("No data available"),
    //             );
    //           }

    //           return ListView.builder(
    //             itemCount: snapshot.data!.length,
    //             itemBuilder: (context, index) {
    //               DateTime date = DateTime.parse(DateTime.now().toString());

    //               return Card(
    //                 margin: EdgeInsets.all(8.0),
    //                 elevation: 5.0,
    //                 shadowColor: Colors.grey,
    //                 child: ChangeNotifierProvider<EventProvider>(
    //                   // create will create the instance of home page provider
    //                   create: (context) => EventProvider(),
    //                   child: Consumer<EventProvider>(
    //                       builder: (context, value, child) {
    //                     return ListTile(
    //                       onTap: () {
    //                         showDialog(
    //                             context: context,
    //                             builder: (context) => AlertDialog(
    //                                   scrollable: true,
    //                                   content: Text(snapshot.data![index]
    //                                       ['event_message']),
    //                                 ));
    //                       },

    //                       contentPadding: EdgeInsets.symmetric(
    //                         vertical: 15.0,
    //                         horizontal: 15.0,
    //                       ),

    //                       // title is here
    //                       title: Text(
    //                         snapshot.data![index]['event_title'],
    //                         //   value.eventData.event_title,
    //                         //  postEvent.eventData.event_title ?? "",
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.w600, fontSize: 20.0),
    //                         maxLines: 2,
    //                         overflow: TextOverflow.ellipsis,
    //                       ),

    //                       subtitle: Text(
    //                         DateFormat("\ndd-MM-yyyy kk:mm a")
    //                             .format(date)
    //                             .toString(),
    //                         style: TextStyle(fontSize: 16),
    //                       ),

    //                       trailing: IconButton(
    //                         onPressed: () async {
    //                           // print(snapshot.data![index]['id']);
    //                           // Map<String, dynamic> data = {
    //                           //   "id": snapshot.data![index]['id']
    //                           // };
    //                           // await eventService.deleteEvent(data);
    //                           // print("Deleted successfully");
    //                           // setState(() {});
    //                         },
    //                         icon: Icon(
    //                           Icons.delete_forever_rounded,
    //                           color: Colors.red,
    //                         ),
    //                       ),

    //                     );
    //                   }),
    //                 ),
    //               );
    //             },
    //           );

    // return ListView.builder(
    //     itemCount: snapshot.data!.length,
    //     itemBuilder: (context, index) {
    //       return Column(
    //         children: [
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    //             child: InkWell(
    //               child: Container(
    //                 constraints: BoxConstraints(
    //                   maxHeight: double.infinity,
    //                 ),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(16),
    //                   color: Colors.tealAccent.shade400,
    //                   border: Border.all(
    //                     color: Colors.redAccent.shade400,
    //                     width: 2,
    //                   ),
    //                 ),
    //                 child: ListTile(
    //                   title: Text(
    //                     snapshot.data![index]['event_title'],
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 16),
    //                   ),
    //                   trailing: Text(
    //                       DateFormat("MMM d").format(DateTime.now())),
    //                 ),
    //               ),

    //               // Ontap function is here
    //               onTap: () {
    //                 String t1 = (snapshot.data![index]['event_title'])
    //                     .toString();
    //                 String m1 = (snapshot.data![index]
    //                         ['event_message'])
    //                     .toString();
    //                 print(t1);
    //                 print('---------------------------');
    //                 print(m1);

    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) =>
    //                             EventReadPage(t1, m1)));
    //                 // print(snapshot.data![index]['event_title']);
    //               },
    //             ),
    //           )
    //         ],
    //       );
    //     });
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // )

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
