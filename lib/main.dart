import 'package:ans/admin/admin_events.dart';
import 'package:ans/admin/admin_notice.dart';
import 'package:ans/views/account.dart';
import 'package:ans/views/caraousel.dart';
import 'package:ans/views/home_grid.dart';
import 'package:ans/views/home_page.dart';
import 'package:ans/views/login.dart';
import 'package:ans/views/my_profile.dart';
import 'package:ans/views/myroutine.dart';
import 'package:ans/views/mysubject.dart';
import 'package:ans/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ans/views/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // This is the main page of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firestore Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminEventPage(),
    );
  }
}
