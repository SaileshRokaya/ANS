import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:ans/admin/admin_panel.dart';
import 'package:ans/api/api_service.dart';
import 'package:ans/api/http_exception.dart';
import 'package:ans/model/login_model.dart';
import 'package:ans/provider/auth_service.dart';
import 'package:ans/views/email_verification.dart';
import 'package:ans/views/home_page.dart';
import 'package:ans/views/navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ans/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // LoginRequestModel? requestModel;

  // Create a global key that uniquely identifies the form widget
  // and allows validation of the form
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Textediting controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // Firebase Authentication
  // final _auth = FirebaseAuth.instance;

  Map<String, dynamic> _authData = {'username': '', 'password': ''};

  // Future _submit() async {
  //   if (!_formKey.currentState!.validate()) {
  //     //invalid
  //     return;
  //   }
  //   _formKey.currentState!.save();
  //   try {
  //     await Provider.of<Auth>(context, listen: false)
  //         .login(_authData['username'], _authData['password']);
  //   } on HttpException catch (e) {
  //     var errorMessage = 'Authentication Failed';
  //     if (e.toString().contains('INVALID_EMAIL')) {
  //       errorMessage = 'Invalid email';
  //       _showerrorDialog(errorMessage);
  //     } else if (e.toString().contains('EMAIL_NOT_FOUND')) {
  //       errorMessage = 'This email not found';
  //       _showerrorDialog(errorMessage);
  //     } else if (e.toString().contains('INVALID_PASSWORD')) {
  //       errorMessage = 'Invalid Password';
  //       _showerrorDialog(errorMessage);
  //     }
  //   } catch (error) {
  //     var errorMessage = 'Plaese try again later';
  //     _showerrorDialog(errorMessage);
  //   }
  // }

  void checkLogin() async {
    // Here we check if user already login or credential already available or not
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    if (val != null && val.isNotEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your username";
                              }
                              // Regular expression for email validation
                              // if (!RegExp(
                              //         "^[a-zA-Z0-9.a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+")
                              //     .hasMatch(value)) {
                              //   return "Please enter a valid email";
                              // }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['username'] = value!;
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
                            validator: (value) {
                              // RegExp regex = new RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return "Password is required";
                              }
                            },

                            onSaved: (value) {
                              _authData['password'] = value!;
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
                                login();
                                // print("Login successfull");
                              }),

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
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void login() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://studentapi.patancollege.edu.np/api/login"),
          body: ({
            "username": emailController.text,
            "password": passwordController.text
          }));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        //  print("Login token: " + body["token"]);
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Token : ${body["token"]}")));
        pageRoute(body['token']);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login Successfull")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fields required")));
    }
  }

  void pageRoute(String token) async {
// Here we store value or token inside shared preferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  // void _showerrorDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: Text(
  //         'An Error Occurs',
  //         style: TextStyle(color: Colors.blue),
  //       ),
  //       content: Text(message),
  //       actions: <Widget>[
  //         FlatButton(
  //           child: Text('Okay'),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
}
