import 'package:ans/api/shared_pre.dart';
import 'package:ans/model/user_model.dart';
import 'package:ans/views/user_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class UserService {
  static const readURL =
      "http://studentapi.patancollege.edu.np/api/registration";

// Create a method eventFromJson which accept one parameter as a string
  //It will decode the string value and store in variable named data as a map
  List<UserModel> eventFromJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    // print("Event Model Data: $data");

    // Convert the json data into map and return as a list
    return List<UserModel>.from(
        data['body'].map((item) => UserModel.fromJson(item)));
  }

  // Create a method getEventData with asynchoruous operation
  // In the future data will be returned in a list form
  Future<List> getUserData() async {
    String? token;
    await SharedPre().getAuthToken().then((value) => {token = value!});
    final response = await http.get(Uri.parse(readURL), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);

      // final jsonResponse = json.decode(response.body);
      // final receiptList = jsonResponse['data'] as List;
      // print("The data is $receiptList");
      // List<Data> myList =
      //     receiptList.map((data) => Data.fromJson(data)).toList();
      // print("My data are $myList");
      // return myList;

      Map<String, dynamic> UserInfo = jsonDecode(response.body);
      // print(UserInfo);

      List<dynamic> detail = UserInfo['data']['registration'];
      print(detail);
      // print("The dynamic list data is $receipt");
      // List _data = List<dynamic>.from(
      //   receipt.map<dynamic>(
      //     (dynamic item) => item,
      //   ),
      // );

      // List<Data> list = eventFromJson(response.body);

      // print("The list item is: $list");

      // return list;
      // print(response.statusCode);
      // List<Data> list = eventFromJson(response.body);
      // print("The data are $list");
      return detail;
    } else {
      // throw Exception('Failed to load');
      return Future.error('Failed to load');
      // return List<UserModel>();
    }
  }
}