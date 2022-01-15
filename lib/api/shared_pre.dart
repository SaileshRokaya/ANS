import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
  Future<bool> setAuthToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(UserPref.AuthToken.toString(), token);
  }

  Future<String?> getAuthToken() async {
    final pref = await SharedPreferences.getInstance();
    print(pref);
    return pref.getString(UserPref.AuthToken.toString());
  }
}

enum UserPref {
  AuthToken,
}
