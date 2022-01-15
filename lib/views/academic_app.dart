import 'package:ans/admin/admin_panel.dart';
import 'package:ans/provider/auth_service.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/provider/leave_service_provider.dart';
import 'package:ans/provider/user_provider.dart';
import 'package:ans/views/home_page.dart';
import 'package:ans/views/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcademicApp extends StatefulWidget {
  @override
  _AcademicAppState createState() => _AcademicAppState();
}

class _AcademicAppState extends State<AcademicApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider()),
        ChangeNotifierProvider<LeaveServiceProvider>(
            create: (_) => LeaveServiceProvider()),
        ChangeNotifierProvider<Auth>(create: (_) => Auth()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
      ),
    );
  }
}
