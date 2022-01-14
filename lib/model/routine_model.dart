class RoutineModel {
  Data? data;

  RoutineModel({this.data});

  RoutineModel.fromJson(Map<String, dynamic> json) {
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
  Routine? routine;
  List<Detail>? detail;

  Data({this.routine, this.detail});

  Data.fromJson(Map<String, dynamic> json) {
    routine =
        json['routine'] != null ? new Routine.fromJson(json['routine']) : null;
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.routine != null) {
      data['routine'] = this.routine!.toJson();
    }
    if (this.detail != null) {
      data['detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Routine {
  int? routineId;
  String? sectionId;
  String? blockName;
  String? roomNo;
  String? applicableFrom;

  Routine(
      {this.routineId,
      this.sectionId,
      this.blockName,
      this.roomNo,
      this.applicableFrom});

  Routine.fromJson(Map<String, dynamic> json) {
    routineId = json['routine_id'];
    sectionId = json['section_id'];
    blockName = json['block_name'];
    roomNo = json['room_no'];
    applicableFrom = json['applicable_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routine_id'] = this.routineId;
    data['section_id'] = this.sectionId;
    data['block_name'] = this.blockName;
    data['room_no'] = this.roomNo;
    data['applicable_from'] = this.applicableFrom;
    return data;
  }
}

class Detail {
  String? day;
  String? startTime;
  String? endTime;
  int? period;
  String? facultyName;
  String? subjectName;
  String? classType;
  String? blockName;
  String? roomNo;

  Detail(
      {this.day,
      this.startTime,
      this.endTime,
      this.period,
      this.facultyName,
      this.subjectName,
      this.classType,
      this.blockName,
      this.roomNo});

  Detail.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    period = json['period'];
    facultyName = json['faculty_name'];
    subjectName = json['subject_name'];
    classType = json['class_type'];
    blockName = json['block_name'];
    roomNo = json['room_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['period'] = this.period;
    data['faculty_name'] = this.facultyName;
    data['subject_name'] = this.subjectName;
    data['class_type'] = this.classType;
    data['block_name'] = this.blockName;
    data['room_no'] = this.roomNo;
    return data;
  }
}
