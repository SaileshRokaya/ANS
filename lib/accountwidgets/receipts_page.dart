import 'package:ans/model/fees_model.dart';
import 'package:ans/provider/event_service_provider.dart';
import 'package:ans/provider/user_provider.dart';
import 'package:ans/service/receipt_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    // return Consumer<UserProvider>(builder: (context, provider, child) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "List Of Receipt",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<List>(
            future: ReceiptService().getReceiptData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.length == 0) {
                  return Center(
                    child: Text("No data Available"),
                  );
                }

                return ListView.builder(
                  //   itemCount: provider.receiptList.length,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, position) {
                    return Column(
                      children: [
                        // User Receipt details
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 140,
                          width: 330,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 20.0,
                                    offset: Offset(0.0, 0.75))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Date and Receipt Number
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Receipt Number: " +
                                          snapshot.data![position]
                                              ["receipt_no"],
                                      //   provider.receiptList[position].receiptNo,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),

                                    Text(
                                      "Receipt Date: " +
                                          snapshot.data![position]
                                              ["receipt_date"],
                                      //  provider.receiptList[position].receiptDate,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    // Course and level
                                    Text(
                                      "Amount Paid: " +
                                          snapshot.data![position]
                                              ["total_amount"],
                                      //  provider.receiptList[position].totalAmount,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
