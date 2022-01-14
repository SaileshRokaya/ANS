class MySubjectModel {
  Data? data;

  MySubjectModel({this.data});

  MySubjectModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Registration? registration;
  List<Subjects>? subjects;

  Data({this.registration, this.subjects});

  Data.fromJson(Map<String, dynamic> json) {
    registration = json['registration'] != null
        ? new Registration.fromJson(json['registration'])
        : null;
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.registration != null) {
      data['registration'] = this.registration!.toJson();
    }
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Registration {
  int? collegeregId;
  String? studyMode;
  String? shiftName;
  String? specialization;
  String? sectionId;
  String? sessionName;
  String? courseName;
  String? semesterName;

  Registration(
      {this.collegeregId,
      this.studyMode,
      this.shiftName,
      this.specialization,
      this.sectionId,
      this.sessionName,
      this.courseName,
      this.semesterName});

  Registration.fromJson(Map<String, dynamic> json) {
    collegeregId = json['collegereg_id'];
    studyMode = json['study_mode'];
    shiftName = json['shift_name'];
    specialization = json['specialization'];
    sectionId = json['section_id'];
    sessionName = json['session_name'];
    courseName = json['course_name'];
    semesterName = json['semester_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collegereg_id'] = this.collegeregId;
    data['study_mode'] = this.studyMode;
    data['shift_name'] = this.shiftName;
    data['specialization'] = this.specialization;
    data['section_id'] = this.sectionId;
    data['session_name'] = this.sessionName;
    data['course_name'] = this.courseName;
    data['semester_name'] = this.semesterName;
    return data;
  }
}

class Subjects {
  int? stuSubId;
  String? subjectCode;
  String? subjectName;
  int? subjectCredit;

  Subjects(
      {this.stuSubId, this.subjectCode, this.subjectName, this.subjectCredit});

  Subjects.fromJson(Map<String, dynamic> json) {
    stuSubId = json['stu_sub_id'];
    subjectCode = json['subject_code'];
    subjectName = json['subject_name'];
    subjectCredit = json['subject_credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stu_sub_id'] = this.stuSubId;
    data['subject_code'] = this.subjectCode;
    data['subject_name'] = this.subjectName;
    data['subject_credit'] = this.subjectCredit;
    return data;
  }
}
