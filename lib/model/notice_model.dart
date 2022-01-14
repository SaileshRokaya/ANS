class NoticeModel {
  List<Data>? data;

  NoticeModel({this.data});

  NoticeModel.fromJson(Map<String, dynamic> json) {
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
  int? noticeId;
  String? subject;
  String? message;
  String? noticeDate;

  Data({this.noticeId, this.subject, this.message, this.noticeDate});

  Data.fromJson(Map<String, dynamic> json) {
    noticeId = json['notice_id'];
    subject = json['subject'];
    message = json['message'];
    noticeDate = json['notice_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notice_id'] = this.noticeId;
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['notice_date'] = this.noticeDate;
    return data;
  }
}
