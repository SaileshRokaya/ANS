class LeaveModel {
  late int id;
  late String subject;
  late String message;
  late String applicationDate;
  late String leaveStartDate;
  late String leaveEndDate;
  late String status;
  late String approverRemarks;

  LeaveModel(
      {required this.id,
      required this.subject,
      required this.message,
      required this.applicationDate,
      required this.leaveStartDate,
      required this.leaveEndDate,
      required this.status,
      required this.approverRemarks});

  LeaveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    message = json['message'];
    applicationDate = json['application_date'];
    leaveStartDate = json['leave_start_date'];
    leaveEndDate = json['leave_end_date'];
    status = json['status'];
    approverRemarks = json['approver_remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['application_date'] = this.applicationDate;
    data['leave_start_date'] = this.leaveStartDate;
    data['leave_end_date'] = this.leaveEndDate;
    data['status'] = this.status;
    data['approver_remarks'] = this.approverRemarks;
    return data;
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "subject": subject,
      "message": message,
      "application_date": applicationDate,
      "leave_start_date": leaveStartDate,
      "leave_end_date": leaveEndDate,
      "status": status,
      "approver_remarks": approverRemarks,
    };
  }
}
