import 'dart:convert';
import 'dart:math';
import 'package:ans/api/shared_pre.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ans/model/leave_model.dart';

class LeaveService {
  static const URL =
      "http://studentapi.patancollege.edu.np/api/leave_applications";

  Future<List> getLeaveData(context) async {
    String? token;
    await SharedPre().getAuthToken().then((value) => {token = value!});
    final response = await http.get(Uri.parse(URL), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);

      Map<String, dynamic> emailList = jsonDecode(response.body);
      print(emailList);

      List<dynamic> receipt = emailList['data'];

      return receipt;
    } else {
      // throw Exception('Failed to load');
      return Future.error('Failed to load');
      // return List<UserModel>();
    }
  }

  // Create a method addEvent with the parameter EventModel class
  // In the future, data will be returned as a string
  Future<String> addLeave(LeaveModel leaveModel) async {
    String? token;
    await SharedPre().getAuthToken().then((value) => {token = value!});
    final response = await http.post(Uri.parse(URL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(leaveModel.toJson()));
    print("The response is ${response.body}");
    print(leaveModel.toJson());
    if (response.statusCode == 200) {
      print("The status is ${response.statusCode}");
      print(" The final response is ${response.body}");
      return response.body;
    } else {
      return "Error";
    }
  }

  // Future<String> addLeave(LeaveModel leaveModel) async {
  //   String? token;
  //   await SharedPre().getAuthToken().then((value) => {token = value!});
  //   final response = await http.post(Uri.parse(URL),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token'
  //       },
  //       body: jsonEncode(leaveModel.toJsonAdd()));

  //   print("The response code is ${response.body}");
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }

  // // Create a method deleteEvent which takes id as a parameter
  // // to delete the respective event.
  // deleteEvent(int id) async {
  //   //print(DELETE_URL + "?id=" + id.toString());
  //   var response =
  //       await http.get(Uri.parse(DELETE_URL + "?id=" + id.toString()));
  //   print("The response id is ${response.body}");
  //   print("The response code is: ${response.statusCode}");
  // }

  // // Create a method updateEVent which takes EventModel as a prameter
  // // The data will be stored as a string in the database in future.
  // Future<String> updateEvent(LeaveModel leaveModel) async {
  //   final response =
  //       await http.post(Uri.parse(UPDATE_URL), body: leaveModel.toJsonUpdate());
  //   if (response.statusCode == 200) {
  //     print("Update Response: " + response.body);
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }
}
