import 'package:ans/model/event_model.dart';
import 'package:ans/service/event_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminEventPage extends StatefulWidget {
  final EventModel? eventModel;
  final int? index;
  AdminEventPage({this.eventModel, this.index});

  @override
  _AdminEventPageState createState() => _AdminEventPageState();
}

class _AdminEventPageState extends State<AdminEventPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  String title = "";
  String message = "";

  EventService eventService = new EventService();

  add(EventModel eventModel) async {
    await eventService.addEvent(eventModel).then((sucess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Added Sucessfully"),
      ));
      print("Add Sucessful");
      // Navigator.pop(context);
    });
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
              controller: titleController,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your title here",
                //labelText: "Email",
              ),
              onChanged: (val) {
                title = titleController.text;
              },
            ),
          ),

          // Message content is here
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: messageController,
              keyboardType: TextInputType.multiline,
              minLines: 1, //Normal textInputField will be displayed
              maxLines: 5, // when user presses enter it will adapt to it
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Message here",
                //labelText: "Email",
              ),
              onChanged: (val) {
                message = messageController.text;
              },
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
            onPressed: () async {
              print("The title is: $title");
              print("The body is: $message");

              if (titleController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("This field is required"),
                ));
              } else {
                EventModel eventModel =
                    EventModel(event_title: title, event_message: message);
                add(eventModel);
              }

              //   Map<String, dynamic> data = {
              //     "event_title": title,
              //     "event_message": message,
              //   };

              //   //make request
              //   String res = await eventService.createEvent(data);

              //   //wait response
              //   res == "success"
              //       ? Fluttertoast.showToast(msg: "Post created successfully")
              //       : Fluttertoast.showToast(msg: "Error creating post");

              //   // to automatic close the dialogue
              //   Navigator.of(context).pop();

              //   // to refresh the screen
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
