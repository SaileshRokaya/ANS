import 'dart:convert';
import 'dart:math';

import 'package:ans/model/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class EventService {
  static const ADD_URL =
      "http://192.168.40.52/pcps_ans_api/api/EventCreate.php";
  static const VIEW_URL = "http://192.168.40.52/pcps_ans_api/api/EventRead.php";
  static const UPDATE_URL = "http://localhost/pcps_api/EventUpdate.php";
  static const DELETE_URL =
      "http://192.168.40.52/pcps_ans_api/api/EventDelete.php";

  List<EventModel> eventFromJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    // print("Event Model Data: $data");

    return List<EventModel>.from(
        data['body'].map((item) => EventModel.fromJson(item)));
  }

  Future<List<EventModel>> getEventData() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      // print(response.body);
      print(response.statusCode);
      List<EventModel> list = eventFromJson(response.body);

      return list;
    } else {
      // throw Exception('Failed to load');
      return Future.error('Failed to load');
      // return List<UserModel>();
    }
  }

  // Insert data to the database
  Future<String> addEvent(EventModel eventModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: eventModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }

  deleteEvent(int id) async {
    //print(DELETE_URL + "?id=" + id.toString());
    var response =
        await http.get(Uri.parse(DELETE_URL + "?id=" + id.toString()));
    print("The response id is ${response.body}");
    print("The response code is: ${response.statusCode}");
  }

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
