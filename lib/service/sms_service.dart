import 'package:ans/api/shared_pre.dart';
import 'package:ans/model/fees_model.dart';
import 'package:ans/model/user_model.dart';
import 'package:ans/views/user_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class SMSService {
  static const readURL = "http://studentapi.patancollege.edu.np/api/sms";

  // Create a method getEventData with asynchoruous operation
  // In the future data will be returned in a list form
  Future<List> getSMSData() async {
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

      Map<String, dynamic> smsList = jsonDecode(response.body);
      // print(receiptList);

      List<dynamic> sms = smsList['data'];
      print(smsList);

      return sms;
    } else {
      return Future.error('Failed to load');
    }
  }
}
