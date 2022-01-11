// To parse this JSON data, do
//
//     final leaveModel = leaveModelFromJson(jsonString);

import 'dart:convert';

LeaveModel leaveModelFromJson(String str) =>
    LeaveModel.fromJson(json.decode(str));

String leaveModelToJson(LeaveModel data) => json.encode(data.toJson());

class LeaveModel {
  LeaveModel({
    required this.id,
    required this.name,
    required this.rollNo,
    required this.level,
    required this.leaveDate,
    required this.status,
    required this.reqReason,
    required this.accRejReason,
  });

  String id;
  String name;
  String rollNo;
  String level;
  String leaveDate;
  String status;
  String reqReason;
  String accRejReason;

  factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
        id: json["id"],
        name: json["name"],
        rollNo: json["roll_no"],
        level: json["level"],
        leaveDate: json["leave_date"],
        status: json["status"],
        reqReason: json["req_reason"],
        accRejReason: json["acc_rej_reason"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "roll_no": rollNo,
        "level": level,
        "leave_date": leaveDate,
        "status": status,
        "req_reason": reqReason,
        "acc_rej_reason": accRejReason,
      };

  Map<String, dynamic> toJsonAdd() {
    return {
      "name": name,
      "roll_no": rollNo,
      "level": level,
      "leave_date": leaveDate,
      "status": status,
      "req_reason": reqReason,
      "acc_rej_reason": accRejReason,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id,
      "name": name,
      "roll_no": rollNo,
      "level": level,
      "leave_date": leaveDate,
      "status": status,
      "req_reason": reqReason,
      "acc_rej_reason": accRejReason,
    };
  }
}
