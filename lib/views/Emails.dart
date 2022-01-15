// ignore_for_file: prefer_const_constructors

import 'package:ans/service/email_service.dart';
import 'package:ans/views/Emails_read.dart';
import 'package:ans/views/Events_read.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  String heading = "Dear Students, Namest and warm getting from PCPS";
  String varFromEmail = "sailesh@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Inbox"),
        ),

        // The body part is here
        body: FutureBuilder<List>(
            future: EmailService().getEmailData(),
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
                            snapshot.data![position]["subject"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          leading: CircleAvatar(
                            child: Text(varFromEmail[0]),
                          ),
                          subtitle: Text(
                            snapshot.data![position]["mail_from"],
                          ),
                          trailing: Text(
                            DateFormat("MMM d").format(date).toString(),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmailReadPage()));
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
