import 'package:ans/model/fees_model.dart';
import 'package:ans/model/user_model.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  // Provider working with rest api
  List<UserModel> userList = [];
  void showUserDetail(List<UserModel> data) {
    this.userList = data;
    notifyListeners();
  }

  // Provider working with rest api
  // List<Data> receiptList = [];
  // void showReceiptDetail(List<Data> data) {
  //   this.receiptList = data;
  //   print(receiptList);
  //   notifyListeners();
  // }
}
