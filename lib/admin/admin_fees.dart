import 'package:ans/accountwidgets/balance_page.dart';
import 'package:ans/accountwidgets/receipts_page.dart';
import 'package:ans/admin/admin_fees_accept.dart';
import 'package:ans/admin/admin_fees_new.dart';
import 'package:ans/admin/admin_fees_reject.dart';
import 'package:flutter/material.dart';

class AdminFeePage extends StatelessWidget {
  const AdminFeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Fee Request Form"),
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
                AdminFeesNewPage(),
                AdminFeesAcceptPage(),
                AdminFeesRejectPage(),
              ],
            )));
  }
}
