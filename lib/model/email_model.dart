class EmailModel {
  List<Data>? data;

  EmailModel({this.data});

  EmailModel.fromJson(Map<String, dynamic> json) {
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
  int? mailId;
  String? mailFrom;
  String? mailFromname;
  String? subject;
  String? htmlMessage;
  String? sentOn;

  Data(
      {this.mailId,
      this.mailFrom,
      this.mailFromname,
      this.subject,
      this.htmlMessage,
      this.sentOn});

  Data.fromJson(Map<String, dynamic> json) {
    mailId = json['mail_id'];
    mailFrom = json['mail_from'];
    mailFromname = json['mail_fromname'];
    subject = json['subject'];
    htmlMessage = json['html_message'];
    sentOn = json['sent_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mail_id'] = this.mailId;
    data['mail_from'] = this.mailFrom;
    data['mail_fromname'] = this.mailFromname;
    data['subject'] = this.subject;
    data['html_message'] = this.htmlMessage;
    data['sent_on'] = this.sentOn;
    return data;
  }
}
