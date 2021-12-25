import 'package:ans/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ans/views/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  

  // Create a text controller and use it to retrieve the current value of the text field
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // Firebase Authentication
  final _auth = FirebaseAuth.instance;

  // adding students data to the database
  CollectionReference std =
      FirebaseFirestore.instance.collection('notification');

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.clear();
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    super.dispose();
  }

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
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.green,
            ),
            title: Text(
              "New Registration",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            centerTitle: true,
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 55,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your name",
                                  labelText: "Name",
                                ),
                                controller: nameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username is required";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  nameController.text = value!;
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              style: TextStyle(
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
                                  return "Please enter your email";
                                }
                                // Regular expression for email validation
                                if (!RegExp(
                                        "^[a-zA-Z0-9.a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+")
                                    .hasMatch(value)) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your phone number",
                                  labelText: "Phone Number",
                                ),
                                controller: phoneController,
                                // The validator receives the text that the user has entered Validation
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Phone number is required";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  phoneController.text = value!;
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: true,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter your password",
                                labelText: "Password",
                              ),
                              controller: passwordController,

                              // The validator receives the text that the user has entered Validation for password
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return "Password is required";
                                }
                                if (!regex.hasMatch(value)) {
                                  return "Enter valid password (Min. 6 character";
                                }
                              },

                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            ElevatedButton(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              style: TextButton.styleFrom(
                                  minimumSize: Size(395, 55)),
                              onPressed: () {
                                signUp(emailController.text,
                                    passwordController.text);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // New user method
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      //await _auth.createUserWithEmailAndPassword(email: email, password: password)
      //.then((value) => {

      //})
      // .catchError((error) => print('Failed to add user: $error'));
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        User? user = FirebaseAuth.instance.currentUser;

        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
          
         postDetailsToFirebase(); 
          Fluttertoast.showToast(msg: "Registration Successful");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Registration Successful",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            );

        }

        Fluttertoast.showToast(msg: "Registration Successful");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "The password provided is too weak.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            );
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "The account already exists for that email.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            );
          Fluttertoast.showToast(
              msg: "The account already exists for that email.");
        }
      } catch (e) {
        print(e);
      }
    }
  }

  postDetailsToFirebase() async {
    // Calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // Writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.phone = phoneController.text;
    userModel.password = passwordController.text;
    userModel.name = nameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully");
  }
}
