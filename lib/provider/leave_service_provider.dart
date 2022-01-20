import 'package:ans/model/leave_model.dart';
import 'package:ans/service/leave_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LeaveServiceProvider with ChangeNotifier {
  LeaveService leaveService = LeaveService();

  int id = 0;
  late String subject = "";
  late String message = "";
  late String applicationDate = "";
  late String leaveStartDate = "";
  late String leaveEndDate = "";
  late String status = "";
  late String approverRemarks = "";

  // Getters
  int get Id => id;
  String get Subject => subject;
  String get Message => message;
  String get ApplicationDate => applicationDate;
  String get LeaveStartDate => leaveStartDate;
  String get LeaveEndDate => leaveEndDate;
  String get Status => status;
  String get ApproverRemarks => approverRemarks;

  // Setters

  set Id(int id) {
    id = id;
  }

  set Subject(String subject) {
    subject = subject;
  }

  set Message(String message) {
    message = message;
  }

  set ApplicationDate(String application) {
    applicationDate = application;
  }

  set LeaveStartDate(String startDate) {
    leaveStartDate = startDate;
  }

  set LeaveEndDate(String endDate) {
    leaveEndDate = endDate;
  }

  set Status(String status) {
    status = status;
  }

  set ApproverRemarks(String remarks) {
    approverRemarks = remarks;
  }

  // View data with provider
  // List<LeaveModel> leaveList = [];
  // void updateEvent(List<LeaveModel> data) {
  //   this.leaveList = data;
  //   notifyListeners();
  // }

  List<dynamic> leaveModel = [];
  bool loading = false;

  fetchData(context) async {
    loading = true;
    leaveModel = await LeaveService().getLeaveData(context);
    loading = false;
    notifyListeners();
  }

  // Add method was created
  // add() async {
  //   // Call the addEvent method from EventService class to add the data on the database
  //   // from the user
  //   if (id == 0) {
  //     var addLeave = LeaveModel(
  //         id: id,
  //         subject: subject,
  //         message: message,
  //         applicationDate: applicationDate,
  //         leaveStartDate: leaveStartDate,
  //         leaveEndDate: leaveEndDate,
  //         status: status,
  //         approverRemarks: approverRemarks);
  //     await LeaveService().addLeave(addLeave);
  //     notifyListeners();
  //   } else {
  //     print("Cannot add the data");
  //   }
  // }

  // update function provider
  // updatedEvent() {
  //   var updateEntry = LeaveModel(
  //     id: id,
  //     subject: subject,
  //     message: message,
  //     applicationDate: applicationDate,
  //     leaveStartDate: leaveStartDate,
  //     leaveEndDate: leaveEndDate,
  //     status: status,
  //     approverRemarks: approverRemarks
  //       );

  //   LeaveService().updateEvent(updateEntry);
  // }
}
