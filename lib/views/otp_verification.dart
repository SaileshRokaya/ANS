// ignore_for_file: prefer_const_constructors

import 'package:ans/views/change_password.dart';
import 'package:flutter/material.dart';
import 'package:ans/views/email_verification.dart';
//import 'package:ans/views/change_password';

class OTPVerify extends StatelessWidget {
  const OTPVerify({Key? key}) : super(key: key);

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
                    MaterialPageRoute(builder: (context) => EmailVerify()));
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.green,
            ),
            title: Text(
              "Verification",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white12,
                          width: 5,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/otp.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Email verification text added here
                    Text(
                      "OTP Verification",
                      style: TextStyle(fontSize: 22, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Enter the OTP sent to",
                      style: TextStyle(fontSize: 22, color: Colors.black38),
                    ),
                    Text(
                      "your email address",
                      style: TextStyle(fontSize: 22, color: Colors.black38),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    // Textfieldform for email type added here
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your Code",
                            labelText: "Code"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Elevated button to verify OTP code added here
                    ElevatedButton(
                      child: Text(
                        "Verify",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(395, 55)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePassword()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
