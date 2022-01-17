// ignore_for_file: prefer_const_constructors

import 'package:ans/service/email_service.dart';
import 'package:ans/service/sms_service.dart';
import 'package:ans/views/Emails_read.dart';
import 'package:ans/views/Events_read.dart';
import 'package:ans/views/sms_read.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SMSPage extends StatefulWidget {
  const SMSPage({Key? key}) : super(key: key);

  @override
  State<SMSPage> createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Inbox"),
        ),

        // The body part is here
        body: FutureBuilder<List>(
            future: SMSService().getSMSData(),
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
                      DateTime date = DateTime.parse(
                          (snapshot.data?[position]["sent_on"]).toString());

                      String dates =
                          DateFormat("\ndd-MM-yyyy").format(date).toString();

                      String sms = snapshot.data![position]['sms_message'];
                      var sm = sms.substring(0, 40);
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        elevation: 5.0,
                        shadowColor: Colors.grey,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          title: Text(
                            sm,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          subtitle: Text(
                            snapshot.data![position]["sent_on"],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          trailing: Text(
                            DateFormat("MMM d").format(date).toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SMSReadPage(
                                          dates: dates,
                                          message: snapshot.data![position]
                                              ["sms_message"],
                                          mobile: snapshot.data![position]
                                              ["mobile_no"],
                                        )));
                          },
                        ),
                      );

                      // Ontap function is here
                    });
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
