import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/views/home_page.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
      ),
    );
  }
}
