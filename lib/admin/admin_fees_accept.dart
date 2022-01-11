// ignore_for_file: prefer_const_constructors

import 'package:ans/admin/leave_fee_detail_form.dart';
import 'package:ans/adminformwidgets/admin_fee_form.dart';
import 'package:ans/fees/fees_form.dart';
import 'package:ans/views/Events_read.dart';
import 'package:ans/views/account.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminFeesAcceptPage extends StatefulWidget {
  const AdminFeesAcceptPage({Key? key}) : super(key: key);

  @override
  State<AdminFeesAcceptPage> createState() => _AdminFeesAcceptPageState();
}

class _AdminFeesAcceptPageState extends State<AdminFeesAcceptPage> {
  String name = "Saroj Chhetri";
  String title = "Leave request for two day";

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, position) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: InkWell(
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black12,
                            width: 2,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text(
                            title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing:
                              Text(DateFormat('MMM d').format(DateTime.now())),
                        ),
                      ),

                      // On tap function here
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LeaveFeeDetail()));
                      },
                    ),
                  ),
                ],
              );
            }));
  }
}
