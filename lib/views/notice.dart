import 'package:ans/views/Events_read.dart';
import 'package:ans/views/notice_read.dart';
import 'package:flutter/material.dart';

class UserNoticePage extends StatelessWidget {
  const UserNoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List of Notice"),
      ),

      // The body part is here
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, position) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: InkWell(
                    child: Container(
                      height: 60,
                      width: 420,
                      decoration: BoxDecoration(
                        //borderRadius: Radius.circular(),
                        color: Colors.black54,
                        border: Border.all(
                          color: Colors.cyan,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 15),
                        child: Text(
                          "Title is here",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Ontap function is here
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoticeReadPage()));
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
