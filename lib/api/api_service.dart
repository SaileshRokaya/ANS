import 'package:ans/model/login_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://studentapi.patancollege.edu.np/api/login";
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.frommJson(jsonDecode(response.body));
    } else {
      //throw Exception("Failed to load data");
      return Future.error("Failed to load data");
    }
  }
}
