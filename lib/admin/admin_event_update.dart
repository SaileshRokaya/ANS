import 'package:ans/admin/admin_event_list.dart';
import 'package:ans/model/event_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/service/event_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'admin_event_list.dart';

class AdminEventUpdatePage extends StatefulWidget {
  // Create an instance of a class
  final EventModel? eventModel;

  // Create a constructor
  AdminEventUpdatePage({Key? key, this.eventModel}) : super(key: key);

  @override
  _AdminEventUpdatePageState createState() => _AdminEventUpdatePageState();
}

class _AdminEventUpdatePageState extends State<AdminEventUpdatePage> {
  TextEditingController id = TextEditingController();
  TextEditingController eventTitle = TextEditingController();
  TextEditingController eventMessage = TextEditingController();
  TextEditingController eventCreated = TextEditingController();

  // EventService eventService = EventService();

  // Create an empty list
  List<EventModel> eventDatas = [];

  // add(EventModel eventModel) async {
  //   await eventService.addEvent(eventModel).then((sucess) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Add Sucessful"),
  //     ));
  //     // print("Add Sucessful");
  //     Navigator.pop(context);
  //   });
  // }

  // Create an update method with the parameter EventModel class
  update(EventModel eventModel) async {
    // Call the updateEvent method from the EventService class
    // to update the event title or event message or both
    await EventService().updateEvent(eventModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Update Sucessful"),
      ));
      // print("Add Sucessful");
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.eventModel != null) {
      eventTitle.text = widget.eventModel!.eventTitle;
      eventMessage.text = widget.eventModel!.eventMessage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context, eveProvider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Update",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // container for notice title
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),

                  // Title content is here
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
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
                      "Update",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                        minimumSize: Size(150, 55),
                        backgroundColor: Colors.lightGreen),
                    onPressed: () {
                      //  To update the event part
                      EventModel eventModel = EventModel(
                          id: widget.eventModel!.id,
                          eventTitle: eventTitle.text,
                          eventMessage: eventMessage.text,
                          eventCreated: widget.eventModel!.eventCreated);

                      // Call the event update method which was instance of calss
                      update(eventModel);

                      // To update the UI screen
                      void reloadData() async {
                        final postMdl =
                            Provider.of<EventProvider>(context, listen: false);
                        eventDatas = await EventService().getEventData();
                        postMdl.updateEvent(eventDatas);
                      }

                      // Call the reloadData method
                      reloadData();
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
