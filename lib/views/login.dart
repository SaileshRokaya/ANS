import 'dart:ui';

import 'package:ans/admin/admin_panel.dart';
import 'package:ans/views/email_verification.dart';
import 'package:ans/views/home_page.dart';
import 'package:ans/views/navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ans/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Create a global key that uniquely identifies the form widget
  // and allows validation of the form
  final _formKey = GlobalKey<FormState>();

  // Textediting controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // Firebase Authentication
  // final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.clear();
    // passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white12,
                        width: 5,
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/Academic.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      // autovalidate: true,
                      key: _formKey,
                      child: Column(
                        children: [
                          // TextFormField to input email address
                          TextFormField(
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter your email",
                              labelText: "Email",
                            ),

                            controller: emailController,

                            // The validator receives the text that the user has entered Validation
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return "Please enter your email";
                            //   }
                            //   // Regular expression for email validation
                            //   // if (!RegExp(
                            //   //         "^[a-zA-Z0-9.a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+")
                            //   //     .hasMatch(value)) {
                            //   //   return "Please enter a valid email";
                            //   // }
                            //   return null;
                            // },
                            onSaved: (value) {
                              emailController.text = value!;
                            },
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          // TextFormField to input password
                          TextFormField(
                            obscureText: true,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter your password",
                              labelText: "Password",
                            ),

                            controller: passwordController,

                            // The validator receives the text that the user has entered Validation for password
                            // validator: (value) {
                            //   RegExp regex = new RegExp(r'^.{6,}$');
                            //   if (value!.isEmpty) {
                            //     return "Password is required";
                            //   }
                            //   if (!regex.hasMatch(value)) {
                            //     return "Enter valid password (Min. 6 character";
                            //   }
                            // },

                            onSaved: (value) {
                              passwordController.text = value!;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Navigate to email-verification page to recover password
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmailVerify()));
                                  },
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  )),
                            ],
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            style: TextButton.styleFrom(
                                minimumSize: Size(395, 55)),
                            onPressed: () {
                              if (emailController.text == "email" &&
                                  passwordController.text == "password") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NavigationBarPage()));
                              } else if (emailController.text == "admin" &&
                                  passwordController.text == "admin") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminHomePage()));
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Email and password doesnot match");
                              }
                              // signIn(emailController.text,
                              //    passwordController.text);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: 'Don\'t have an account?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' Sign up',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 20),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Registration()));
                                            }),
                                    ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Login method
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        print(email + " " + password);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Fluttertoast.showToast(msg: "Login successfull");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        print("Good Bye");
        //dispose();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'No user found for that email.',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
          Fluttertoast.showToast(msg: "No user found for that email");
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          Fluttertoast.showToast(msg: "Wrong password provided for that user");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Wrong password provided for that user",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
      }

      // await _auth
      //     .signInWithEmailAndPassword(email: email, password: password)
      //     .then((uid) => {
      //           print(uid),
      //           print("Loged In"),
      //           Fluttertoast.showToast(msg: "Login Successfull"),
      //           Navigator.of(context).pushReplacement(
      //               MaterialPageRoute(builder: (context) => EmailVerify())),
      //           print("Hello world")
      //         })
      //     .catchError((error) => print('Failed to add user: $error'));
      //{
      //print("Wrong password");
      //Fluttertoast.showToast(msg: e!.message);
      //});
    }
  }
}
