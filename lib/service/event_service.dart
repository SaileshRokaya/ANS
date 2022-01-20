import 'dart:convert';
import 'dart:math';

import 'package:ans/api/shared_pre.dart';
import 'package:ans/model/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class EventService {
  // Variables with the url as a value in string form
  static const ADD_URL =
      "http://192.168.40.37/pcps_ans_api/api/EventCreate.php";
  static const URL = "http://studentapi.patancollege.edu.np/api/events";
  static const UPDATE_URL =
      "http://192.168.40.37/pcps_ans_api/api/EventUpdate.php";
  static const DELETE_URL =
      "http://192.168.40.37/pcps_ans_api/api/EventDelete.php";

  // Create a method eventFromJson which accept one parameter as a string
  //It will decode the string value and store in variable named data as a map
  // List<EventModel> eventFromJson(String jsonString) {
  //   final Map<String, dynamic> data = json.decode(jsonString);
  //   // print("Event Model Data: $data");

  //   // Convert the json data into map and return as a list
  //   return List<EventModel>.from(
  //       data['data'].map((item) => EventModel.fromJson(item)));
  // }

  // // Create a method getEventData with asynchoruous operation
  // // In the future data will be returned in a list form
  // Future<List<EventModel>> getEventData() async {
  //   final response = await http.get(Uri.parse(URL));
  //   print('The result are ${response.body}');
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     print(response.statusCode);
  //     List<EventModel> list = eventFromJson(response.body);

  //     return list;
  //   } else {
  //     // throw Exception('Failed to load');
  //     return Future.error('Failed to load');
  //     // return List<UserModel>();
  //   }
  // }

  Future<EventModel> getEventData(context) async {
    late EventModel result;
    try {
      final response = await http.get(
        Uri.parse(URL),
        headers: {
          "contentTypeHeader": "application/json",
          "Accept": "application/json"
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = EventModel.fromJson(item);
      } else {
        Fluttertoast.showToast(msg: "Data not found");
      }
    } catch (e) {}
    return result;
  }
  // Future<EventModel> getEventData() async {
  //    EventModel eventModel;
  //   try {
  //     final response = await http.get(Uri.parse(URL), headers: {
  //       'Content-Type': 'application/json'
  //     });

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       eventModel = EventModel.fromJson(data);
  //     } else {
  //       print("Something went wrong");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   return eventModel;
  // }

  // Create a method addEvent with the parameter EventModel class
  // In the future, data will be returned as a string
  Future<String> addEvent(EventModel eventModel) async {
    final response =
        await http.post(Uri.parse(URL), body: eventModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }

  // Create a method deleteEvent which takes id as a parameter
  // to delete the respective event.
  deleteEvent(int id) async {
    //print(DELETE_URL + "?id=" + id.toString());
    var response = await http.get(Uri.parse(URL + "?id=" + id.toString()));
    print("The response id is ${response.body}");
    print("The response code is: ${response.statusCode}");
  }

  // Create a method updateEVent which takes EventModel as a prameter
  // The data will be stored as a string in the database in future.
  Future<String> updateEvent(EventModel eventModel) async {
    final response =
        await http.post(Uri.parse(URL), body: eventModel.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Update Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
