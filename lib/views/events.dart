import 'package:ans/model/event_model.dart';
import 'package:ans/service/event_service.dart';
import 'package:ans/views/Events_read.dart';
import 'package:flutter/material.dart';

class EventView extends StatefulWidget {
  const EventView({Key? key, String? title}) : super(key: key);

  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  late List<EventModel> eventList;
  bool loading = true;

  getAllEvent() async {
    eventList = await EventService().getEvent();
    setState(() {
      loading = false;
    });
    print("Event: ${eventList.length}");
  }

  delete(EventModel eventModel) async {
    await EventService().deleteEvent(eventModel);
    setState(() {
      loading = true;
      getAllEvent();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Delete Sucessful"),
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventReadPage(),
                ),
              ).then((value) => getAllEvent);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: eventList.length,
              itemBuilder: (context, index) {
                EventModel user = eventList[index];
                return ListTile(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => EventReadPage(),
                  //     ),
                  //   );
                  // },
                  leading: CircleAvatar(
                    child: Text(user.event_title[0]),
                  ),
                  title: Text(user.event_title),
                  // subtitle: Text(user.event_message),
                  // trailing: IconButton(
                  //     icon: Icon(Icons.delete),
                  //     onPressed: () {
                  //       delete(user);
                  //     }),
                );
              }),
    );
  }
}
