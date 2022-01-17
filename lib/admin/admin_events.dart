import 'package:ans/admin/admin_event_list.dart';
import 'package:ans/model/event_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/service/event_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'admin_event_list.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AdminEventPage extends StatefulWidget {
  // Create an instance
  final EventModel? eventModel;
  final int? index;

  // Create a constructor
  AdminEventPage({this.eventModel, this.index});

  @override
  _AdminEventPageState createState() => _AdminEventPageState();
}

class _AdminEventPageState extends State<AdminEventPage> {
  TextEditingController id = TextEditingController();
  TextEditingController eventTitle = TextEditingController();
  TextEditingController eventMessage = TextEditingController();
  TextEditingController eventCreated = TextEditingController();

  EventService eventService = EventService();

  // Initialize the flutterlocalnotification

  // Create an empty list eventData to store the event data
  List<EventModel> eventDatas = [];

  // Add method was created
  add(EventModel eventModel) async {
    // Call the addEvent method from EventService class to add the data on the database
    // from the user
    await eventService.addEvent(eventModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Add Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      // editMode = true;
      eventTitle.text = widget.eventModel!.eventTitle;
      eventMessage.text = widget.eventModel!.eventMessage;
    }

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd  kk:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Events",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // container for notice title
          Padding(
            padding: const EdgeInsets.all(16.0),

            // Title content is here
            child: TextFormField(
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your title here",
                //labelText: "Email",
              ),
              controller: eventTitle,
            ),
          ),

          // Message content is here
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1, //Normal textInputField will be displayed
              maxLines: 5, // when user presses enter it will adapt to it
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Message here",
              ),
              controller: eventMessage,
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text(
              "Send",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(minimumSize: Size(200, 55)),
            onPressed: () {
              // If the user didnot input text on title form field
              // then it will show an error with the message
              if (eventTitle.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("This field is required"),
                ));
              } else {
                // Value were input on the eventmodel constructor
                EventModel eventModel = EventModel(
                  id: id.text,
                  eventTitle: eventTitle.text,
                  eventMessage: eventMessage.text,
                  eventCreated: eventCreated.text,
                );

                // Add method was called
                add(eventModel);

                // To update the UI Screen
                void reloadData() async {
                  final postMdl =
                      Provider.of<EventProvider>(context, listen: false);
                  eventDatas = await EventService().getEventData();
                  postMdl.updateEvent(eventDatas);
                }

                reloadData();
              }
              print("Send successfully");
            },
          ),
        ],
      ),
    );
  }
}
