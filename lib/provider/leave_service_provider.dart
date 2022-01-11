import 'package:ans/model/leave_model.dart';
import 'package:ans/service/leave_service.dart';
import 'package:flutter/cupertino.dart';

class LeaveServiceProvider with ChangeNotifier {
  LeaveService leaveService = LeaveService();

  late String id;
  late String name;
  late String rollNo;
  late String level;
  late String leaveDate;
  late String status;
  late String reqReason;
  late String accRejReason;
  late String course;

  // Getters
  String get Id => id;
  String get Name => name;
  String get RollNo => rollNo;
  String get Level => level;
  String get Reason => reqReason;
  String get Status => status;
  String get Course => course;

  // Setters

  set Id(String id) {
    id = id;
  }

  set Name(String name) {
    name = name;
  }

  set RollNo(String roll) {
    rollNo = roll;
  }

  set Level(String level) {
    level = level;
  }

  set Course(String course) {
    course = course;
  }

  set Status(String status) {
    status = status;
  }

  set Reason(String reason) {
    reqReason = reason;
  }

  // View data with provider
  List<LeaveModel> leaveList = [];
  void updateEvent(List<LeaveModel> data) {
    this.leaveList = data;
    notifyListeners();
  }

  // update function provider
  updatedEvent() {
    var updateEntry = LeaveModel(
        id: id,
        name: name,
        course: course,
        level: level,
        rollNo: rollNo,
        status: status,
        leaveDate: leaveDate,
        reqReason: reqReason,
        accRejReason: accRejReason);

    LeaveService().updateEvent(updateEntry);
  }
}
