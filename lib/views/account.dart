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

    // body: Padding(
    //   padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
    //   child: Column(
    //     children: [
    //       // User Receipt details
    //       Container(
    //         height: 125,
    //         width: 450,
    //         decoration: BoxDecoration(
    //           color: Colors.black54,
    //           border: Border.all(
    //             color: Colors.cyan,
    //             width: 2,
    //           ),
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             // Date and Receipt Number
    //             Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "Date:",
    //                     style: TextStyle(
    //                         fontSize: 20, fontWeight: FontWeight.bold),
    //                   ),
    //                   SizedBox(
    //                     height: 15,
    //                   ),
    //                   Text(
    //                     "Receipt No:",
    //                     style: TextStyle(
    //                         fontSize: 20, fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //             ),

    //             // Course and level
    //             Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: Text(
    //                 "Amount:",
    //                 style:
    //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),

    //       // User Balance details
    //       Container(
    //         height: 125,
    //         width: 450,
    //         decoration: BoxDecoration(
    //           color: Colors.black54,
    //           border: Border.all(
    //             color: Colors.cyan,
    //             width: 2,
    //           ),
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             // Total due and total paid
    //             Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "Total Due:",
    //                     style: TextStyle(
    //                         fontSize: 20, fontWeight: FontWeight.bold),
    //                   ),
    //                   SizedBox(
    //                     height: 15,
    //                   ),
    //                   Text(
    //                     "Total Paid:",
    //                     style: TextStyle(
    //                         fontSize: 20, fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //             ),

    //             // Balance
    //             Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: Text(
    //                 "Balance:",
    //                 style:
    //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
  }
}
