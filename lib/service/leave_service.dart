import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:ans/model/leave_model.dart';

class LeaveService {
  static const ADD_URL =
      "http://192.168.40.58/pcps_ans_api/api/LeaveReqCreate.php";
  static const VIEW_URL =
      "http://192.168.40.58/pcps_ans_api/api/LeaveReqRead.php";
  static const UPDATE_URL =
      "http://192.168.40.58/pcps_ans_api/api/LeaveReqUpdate.php";
  static const DELETE_URL =
      "http://192.168.40.58/pcps_ans_api/api/LeaveReqDelete.php";

  // Create a method addEvent with the parameter EventModel class
  // In the future, data will be returned as a string
  Future<String> addLeave(LeaveModel leaveModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: leaveModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }

  // Create a method eventFromJson which accept one parameter as a string
  //It will decode the string value and store in variable named data as a map
  List<LeaveModel> eventFromJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    // print("Event Model Data: $data");

    // Convert the json data into map and return as a list
    return List<LeaveModel>.from(
        data['body'].map((item) => LeaveModel.fromJson(item)));
  }

  // Create a method getEventData with asynchoruous operation
  // In the future data will be returned in a list form
  Future<List<LeaveModel>> getLeaveData() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      // print(response.body);
      print(response.statusCode);
      List<LeaveModel> list = eventFromJson(response.body);

      return list;
    } else {
      // throw Exception('Failed to load');
      return Future.error('Failed to load');
      // return List<UserModel>();
    }
  }

  // Create a method deleteEvent which takes id as a parameter
  // to delete the respective event.
  deleteEvent(int id) async {
    //print(DELETE_URL + "?id=" + id.toString());
    var response =
        await http.get(Uri.parse(DELETE_URL + "?id=" + id.toString()));
    print("The response id is ${response.body}");
    print("The response code is: ${response.statusCode}");
  }

  // Create a method updateEVent which takes EventModel as a prameter
  // The data will be stored as a string in the database in future.
  Future<String> updateEvent(LeaveModel leaveModel) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: leaveModel.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Update Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
