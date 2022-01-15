import 'package:ans/api/shared_pre.dart';

class Api {
  static const authUrl = "http://studentapi.patancollege.edu.np/api";
  static const authKey = 'Your Token';

  Future<void> loginUser(String token) async {
    // String token = "";
    await SharedPre().setAuthToken(token);
  }
}
