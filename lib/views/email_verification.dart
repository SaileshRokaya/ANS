// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:ans/views/otp_verification.dart';
import 'package:ans/views/login.dart';

class EmailVerify extends StatelessWidget {
  const EmailVerify({Key? key}) : super(key: key);

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
                    MaterialPageRoute(builder: (context) => Login()));
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.green,
            ),
            title: Text(
              "Reset Password",
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
                          image: AssetImage('assets/images/email-verify.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Email verification text added here
                    Text(
                      "Entered the registered email address",
                      style: TextStyle(fontSize: 22, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We will email you a link to reset",
                      style: TextStyle(fontSize: 22, color: Colors.black38),
                    ),
                    Text(
                      "your password",
                      style: TextStyle(fontSize: 22, color: Colors.black38),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    // Textfieldform for email type added here
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your email",
                            labelText: "Email"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Elevated button to verify email added here
                    ElevatedButton(
                      child: Text(
                        "Send",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(395, 55)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPVerify()));
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
