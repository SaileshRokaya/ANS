import 'package:ans/accountwidgets/balance_page.dart';
import 'package:ans/accountwidgets/receipts_page.dart';
import 'package:flutter/material.dart';

class FeePage extends StatelessWidget {
  const FeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Account Details"),
              centerTitle: true,

              // bottom
              bottom: TabBar(tabs: [
                Tab(
                  text: "Receipts",
                ),
                Tab(
                  text: "Your Balance",
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                ReceiptPage(),
                BalancePage(),
              ],
            )));
  }
}
