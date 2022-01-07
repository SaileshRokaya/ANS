import 'package:ans/admin/admin_events.dart';
import 'package:ans/admin/admin_notice.dart';
import 'package:ans/admin/admin_panel.dart';
import 'package:ans/model/event_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/service/event_service.dart';
import 'package:ans/views/academic_app.dart';
import 'package:ans/views/account.dart';
import 'package:ans/views/caraousel.dart';
import 'package:ans/views/events.dart';
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
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AcademicApp());
}
