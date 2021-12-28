import 'package:ans/accountwidgets/balance_page.dart';
import 'package:ans/accountwidgets/receipts_page.dart';
import 'package:ans/admin/admin_leave_accept.dart';
import 'package:ans/admin/admin_leave_new.dart';
import 'package:ans/admin/admin_leave_reject.dart';
import 'package:flutter/material.dart';

class AdminLeavePage extends StatelessWidget {
  const AdminLeavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Leave Request Form"),
              centerTitle: true,

              // bottom
              bottom: TabBar(tabs: [
                // New content is here
                Tab(
                  text: "New",
                ),

                // Accept content is here
                Tab(
                  text: "Accept",
                ),

                // Reject content is here
                Tab(
                  text: "Reject",
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                AdminLeaveNewPage(),
                AdminLeaveAcceptPage(),
                AdminLeaveRejectPage(),
              ],
            )));
  }
}
