class UserModel {
  // Create an instance of class
  String? name;
  String? email;
  String? username;
  int? edusysId;
  String? mobileNo;
  int? studentId;

  // Create a constructor
  UserModel(
      {this.name,
      this.email,
      this.username,
      this.edusysId,
      this.mobileNo,
      this.studentId});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    username = json['username'];
    edusysId = json['edusys_id'];
    mobileNo = json['mobile_no'];
    studentId = json['student_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['edusys_id'] = this.edusysId;
    data['mobile_no'] = this.mobileNo;
    data['student_id'] = this.studentId;
    return data;
  }
}
