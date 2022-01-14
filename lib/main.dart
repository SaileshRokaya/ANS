import 'package:ans/provider/auth_service.dart';
import 'package:ans/views/academic_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// Future<void> backroundHandler(RemoteMessage message) async {
//   print("This is message from background");
//   print(message.notification!.title);
//   print(message.notification!.body);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Auth au = Auth();
  // au.Authentication("saroj", "belbase", "no found");
  // FirebaseMessaging.onBackgroundMessage(backroundHandler);
  runApp(AcademicApp());
}
