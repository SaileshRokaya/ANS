import 'package:ans/api/shared_pre.dart';
import 'package:ans/model/fees_model.dart';
import 'package:ans/model/user_model.dart';
import 'package:ans/views/user_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class ReceiptService {
  static const readURL = "http://studentapi.patancollege.edu.np/api/receipt";

// Create a method eventFromJson which accept one parameter as a string
  //It will decode the string value and store in variable named data as a map
  List<Data> eventFromJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    // print("Event Model Data: $data");

    // Convert the json data into map and return as a list
    return List<Data>.from(data['data'].map((item) => Data.fromJson(item)));
  }

  // Create a method getEventData with asynchoruous operation
  // In the future data will be returned in a list form
  Future<List<Data>> getReceiptData() async {
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

      Map<String, dynamic> receiptList = jsonDecode(response.body);
      print(receiptList);

      List<dynamic> receipt = receiptList['data'];
      // print("The dynamic list data is $receipt");
      // List _data = List<dynamic>.from(
      //   receipt.map<dynamic>(
      //     (dynamic item) => item,
      //   ),
      // );

      List<Data> list = eventFromJson(response.body);

      // print("The list item is: $list");

      // return list;
      // print(response.statusCode);
      // List<Data> list = eventFromJson(response.body);
      // print("The data are $list");
      return list;
    } else {
      // throw Exception('Failed to load');
      return Future.error('Failed to load');
      // return List<UserModel>();
    }
  }
}
