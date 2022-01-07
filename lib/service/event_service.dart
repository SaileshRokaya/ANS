import 'dart:convert';

import 'package:ans/model/event_model.dart';
import 'package:http/http.dart' as http;

class EventService {
  static const ADD_URL =
      "http://192.168.40.88/pcps_ans_api/api/EventCreate.php";
  static const VIEW_URL = "http://192.168.40.88/pcps_ans_api/api/EventRead.php";
  static const UPDATE_URL =
      "http://192.168.40.88/pcps_ans_api/api/EventUpdate.php";
  static const DELETE_URL =
      "http://192.168.40.88/pcps_ans_api/api/EventDelete.php";

  Future<String> addEvent(EventModel eventModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: eventModel.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
