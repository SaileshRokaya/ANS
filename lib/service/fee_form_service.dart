import 'dart:convert';
import 'dart:math';
import 'package:ans/model/fees_model.dart';
import 'package:http/http.dart' as http;
import 'package:ans/model/leave_model.dart';

class FeeService {
  static const ADD_URL =
      "http://192.168.40.37/pcps_ans_api/api/LeaveReqCreate.php";
  static const VIEW_URL =
      "http://192.168.40.37/pcps_ans_api/api/LeaveReqRead.php";
  static const UPDATE_URL =
      "http://192.168.40.37/pcps_ans_api/api/LeaveReqUpdate.php";
  static const DELETE_URL =
      "http://192.168.40.37/pcps_ans_api/api/LeaveReqDelete.php";

  // Create a method addEvent with the parameter EventModel class
  // In the future, data will be returned as a string
  Future<String> addFees(FeeModel feeModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: feeModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }

  // Create a method eventFromJson which accept one parameter as a string
  //It will decode the string value and store in variable named data as a map
  List<FeeModel> eventFromJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    // print("Event Model Data: $data");

    // Convert the json data into map and return as a list
    return List<FeeModel>.from(
        data['body'].map((item) => FeeModel.fromJson(item)));
  }

  // Create a method getEventData with asynchoruous operation
  // In the future data will be returned in a list form
  Future<List<FeeModel>> getfeeData() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      // print(response.body);
      print(response.statusCode);
      List<FeeModel> list = eventFromJson(response.body);

      return list;
    } else {
      return Future.error('Failed to load');
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
  Future<String> updateEvent(FeeModel feeModel) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: feeModel.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Update Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
