import 'package:flutter/foundation.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? password;

  UserModel({this.uid, this.name, this.email, this.phone, this.password});

  // receive data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      password: map['password']
    );
  }

  // Sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password
    };
  }



}