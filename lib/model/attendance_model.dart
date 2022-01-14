class AttendanceModel {
  List<Data>? data;

  AttendanceModel({this.data});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? subjectShortName;
  String? subjectCode;
  String? subjectName;
  int? registrationId;
  int? subjectId;
  String? sectionId;
  String? totalPeriod;
  String? present;
  String? absent;
  Null? late;
  Null? leave;

  Data(
      {this.subjectShortName,
      this.subjectCode,
      this.subjectName,
      this.registrationId,
      this.subjectId,
      this.sectionId,
      this.totalPeriod,
      this.present,
      this.absent,
      this.late,
      this.leave});

  Data.fromJson(Map<String, dynamic> json) {
    subjectShortName = json['subject_short_name'];
    subjectCode = json['subject_code'];
    subjectName = json['subject_name'];
    registrationId = json['registration_id'];
    subjectId = json['subject_id'];
    sectionId = json['section_id'];
    totalPeriod = json['total_period'];
    present = json['present'];
    absent = json['absent'];
    late = json['late'];
    leave = json['leave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_short_name'] = this.subjectShortName;
    data['subject_code'] = this.subjectCode;
    data['subject_name'] = this.subjectName;
    data['registration_id'] = this.registrationId;
    data['subject_id'] = this.subjectId;
    data['section_id'] = this.sectionId;
    data['total_period'] = this.totalPeriod;
    data['present'] = this.present;
    data['absent'] = this.absent;
    data['late'] = this.late;
    data['leave'] = this.leave;
    return data;
  }
}
