import 'package:ans/api/shared_pre.dart';
import 'package:ans/provider/user_provider.dart';
import 'package:ans/service/receipt_service.dart';
import 'package:ans/service/user_service.dart';
import 'package:ans/views/academic_app.dart';
import 'package:ans/views/user_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ReceiptService receiptService = ReceiptService();

  runApp(AcademicApp());
}
