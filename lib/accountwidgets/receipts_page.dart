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
// Create an empty list to store the list of event coming from the database
  List<Data> receiptDatas = [];

  // Create a method reloadData to update the UI screen
  // void reloadData() async {
  //   final postMdl = Provider.of<UserProvider>(context, listen: false);
  //   receiptDatas = await ReceiptService().getReceiptData();
  //   //  postMdl.updateEvent(eventDatas);
  // }

  // // Create a method getEventUser to get all the event list
  // getEventUser() async {
  //   // All the event list will be stored in eventDatas
  //   receiptDatas = await ReceiptService().getReceiptData();
  // }

  // Create an update method to update the event title and message
  // update(EventModel eventModel) async {
  //   // Call the updateEvent method from the class EventService to update the
  //   // event title and event message
  //   await EventService().updateEvent(eventModel).then((sucess) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Update Sucessful"),
  //     ));
  //     // print("Add Sucessful");
  //     Navigator.pop(context);
  //   });
  // }

//  bool editMode = false;

  // This method will call everytime
  // @override
  // void initState() {
  //   reloadData();
  // }

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
                          height: 145,
                          width: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black12,
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
                                          fontSize: 21,
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
                                          fontSize: 21,
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
                                          fontSize: 21,
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
