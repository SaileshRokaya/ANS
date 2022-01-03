import 'dart:convert';

import 'package:ans/model/event_model.dart';
import 'package:http/http.dart' as http;

class EventService {
  static const ADD_URL = "http://localhost/pcps_api/EventCreate.php";
  static const VIEW_URL = "http://192.168.1.73/pcps_api/EventRead.php";
  static const UPDATE_URL = "http://localhost/pcps_api/EventUpdate.php";
  static const DELETE_URL = "http://localhost/pcps_api/EventDelete.php";

  // Future<String> addEvent(EventModel eventModel) async {
  //   print("hello");
  //   final response =
  //       await http.post(Uri.parse(ADD_URL), body: eventModel.toJsonAdd());
  //   if (response.statusCode == 200) {
  //     print("save");
  //     print("Add Response: " + response.body);
  //     print("Exit");
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }

  // List<EventModel> eventFromJson(String jsonString) {
  //   final data = json.decode(jsonString);
  //   print("Event Model Data: $data");

  //   return List<EventModel>.from(data.map((item) => EventModel.fromJson(item)));
  // }

  Future<List> getEvent() async {
    print("hello123");
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      // List<EventModel> events = [];

      // print("Response body: $jsonData");

      // for (var e in jsonData) {
      //   EventModel event = EventModel(
      //       e['event_message'],
      //       e['event_title'],
      //       e['id']);
      //   events.add(event);
      // }

      // print("Save");

      // print(events.length);
      // print(events);

      //List<EventModel> list = eventFromJson(response.body);

      //print(jsonData);

      return jsonData;
    } else {
      return Future.error('Failed to load');
    }
  }

  // Future<String> updateEvent(EventModel eventModel) async {
  //   final response =
  //       await http.post(Uri.parse(UPDATE_URL), body: eventModel.toJsonUpdate());
  //   if (response.statusCode == 200) {
  //     print("Update Response: " + response.body);
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }

  // Future<String> deleteEvent(EventModel eventModel) async {
  //   final response = await http.post(
  //       Uri.parse(
  //         DELETE_URL,
  //       ),
  //       // it returns the id of the user from the toJsonDelete method
  //       body: eventModel.toJsonDelete());
  //   // response.body = jsonEncode("id":id);
  //   if (response.statusCode == 200) {
  //     print("Delete Response: " + response.body);
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }
}
