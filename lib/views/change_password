// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ans/views/login.dart';
import 'package:ans/views/otp_verification.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => OTPVerify()));
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.green,
            ),
            title: Text(
              "Change Password",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            centerTitle: true,
          ),
          body: Center(
              child: Container(
            width: 400,
            height: 500,
            decoration: BoxDecoration(
                color: Colors.white38,
                border: Border.all(
                  color: Colors.green,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 22.0, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Change your password",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    TextField(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "New Password"),
                      //labelText: "Code"),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    TextField(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Confirm New Password"),
                      //labelText: "Code"),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(395, 55)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
        )
      ],
    );
  }
}
