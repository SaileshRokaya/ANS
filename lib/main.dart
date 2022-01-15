import 'package:ans/api/shared_pre.dart';
import 'package:ans/provider/auth_service.dart';
import 'package:ans/service/receipt_service.dart';
import 'package:ans/views/academic_app.dart';
import 'package:ans/views/user_profile.dart';
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
  ReceiptService receiptService = ReceiptService();
  // receiptService.getReceiptData();

  SharedPre sha = SharedPre();
  final val = await sha.getAuthToken();
  print(val);

  // Auth au = Auth();
  // au.Authentication("saroj", "belbase", "no found");
  // FirebaseMessaging.onBackgroundMessage(backroundHandler);
  runApp(AcademicApp());
}
