import 'package:ans/views/change_password.dart';
import 'package:ans/views/home_page.dart';
import 'package:ans/views/login.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variables
    String name = "saroj";
    String email = "Saroj@gmail.com";
    String regDate = "27 Dec 2021";
    String mobile = "9874382718";
    String rollNo = "200213";
    String nationality = "Nepali";
    String course = "Bsc(Hone) CSSE";
    String gender = "Male";
    String unID = "193433";

    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.teal.shade400,
                  //backgroundImage: AssetImage("logo.png"),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Container for user details
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        "Name:" + " " + name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Email
                      Text(
                        "Email: " + email,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Registration Date
                      Text(
                        "Reg. Date: " + regDate,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Mobile Number
                      Text(
                        "Mobile: " + mobile,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Roll No
                      Text(
                        "Roll No.: " + rollNo,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Nationality
                      Text(
                        "Nationality: " + nationality,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Course
                      Text(
                        "Course: " + course,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Gender
                      Text(
                        "Gender: " + gender,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // University id
                      Text(
                        "University ID: " + unID,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      // Create row for two buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // change password button
                          ElevatedButton(
                            child: Text(
                              "Change password",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            style:
                                TextButton.styleFrom(minimumSize: Size(30, 45)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangePassword()));
                            },
                          ),

                          // Log out button
                          ElevatedButton(
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            style:
                                TextButton.styleFrom(minimumSize: Size(30, 45)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
