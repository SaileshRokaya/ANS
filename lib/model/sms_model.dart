class SMSModel {
  List<Data>? data;

  SMSModel({this.data});

  SMSModel.fromJson(Map<String, dynamic> json) {
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
  int? smsId;
  String? mobileNo;
  String? smsMessage;
  String? sentOn;

  Data({this.smsId, this.mobileNo, this.smsMessage, this.sentOn});

  Data.fromJson(Map<String, dynamic> json) {
    smsId = json['sms_id'];
    mobileNo = json['mobile_no'];
    smsMessage = json['sms_message'];
    sentOn = json['sent_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sms_id'] = this.smsId;
    data['mobile_no'] = this.mobileNo;
    data['sms_message'] = this.smsMessage;
    data['sent_on'] = this.sentOn;
    return data;
  }
}
