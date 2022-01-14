class FeesModel {
  List<Data>? data;

  FeesModel({this.data});

  FeesModel.fromJson(Map<String, dynamic> json) {
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
  String? receiptNo;
  String? receiptDate;
  String? totalAmount;

  Data({this.receiptNo, this.receiptDate, this.totalAmount});

  Data.fromJson(Map<String, dynamic> json) {
    receiptNo = json['receipt_no'];
    receiptDate = json['receipt_date'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receipt_no'] = this.receiptNo;
    data['receipt_date'] = this.receiptDate;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}
