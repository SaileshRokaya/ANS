import 'package:ans/service/routine_service.dart';
import 'package:ans/service/subject_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Subject"),
          centerTitle: true,
        ),
        body: FutureBuilder<List>(
            future: SubjectService().getSubjectData(),
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
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          color: Colors.blue,
                          child: Container(
                            width: 180,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // For subject name
                                  Text(
                                    snapshot.data![position]["subject_name"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Subject code
                                      Text(
                                        "Subject Code: ${snapshot.data![position]["subject_code"]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Credit: ${(snapshot.data![position]["subject_credit"]).toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
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
