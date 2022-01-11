import 'package:ans/model/leave_model.dart';
import 'package:flutter/cupertino.dart';

class LeaveServiceProvider with ChangeNotifier {
  late String id;
  late String name;
  late String rollNo;
  late String level;
  late String leaveDate;
  late String status;
  late String reqReason;
  late String accRejReason;

  // Getters
  // String get name => name;
  // String get rollNo => rollNo;
  // String get level => level;
  // String get reqReason => reqReason;

  // // Setters
  // set changeTitle(String title) {
  //   eventTitle = title;
  // }

  // set changeMessage(String message) {
  //   eventMessage = message;
  // }

  // View data with provider
  List<LeaveModel> leaveList = [];
  void updateEvent(List<LeaveModel> data) {
    this.leaveList = data;
    notifyListeners();
  }
}
