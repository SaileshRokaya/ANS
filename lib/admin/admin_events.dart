import 'package:ans/admin/admin_event_list.dart';
import 'package:ans/model/event_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/service/event_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'admin_event_list.dart';

class AdminEventPage extends StatefulWidget {
  final EventModel? eventModel;
  final int? index;
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

  List<EventModel> eventDatas = [];

  add(EventModel eventModel) async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Send Events",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                //labelText: "Email",
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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(minimumSize: Size(110, 55)),
            onPressed: () {
              if (eventTitle.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("This field is required"),
                ));
              } else {
                EventModel eventModel = EventModel(
                  id: id.text,
                  eventTitle: eventTitle.text,
                  eventMessage: eventMessage.text,
                  eventCreated: eventCreated.text,
                );
                add(eventModel);

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
