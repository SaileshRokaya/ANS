import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  String token = "";

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // await pref.setString("login", token);
    setState(() {
      token = pref.getString("login")!;
    });
    print(token);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCred();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Subject"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, position) {
            return Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // For subject name
                      Text(
                        "Object oriented and software engineering",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Subject code
                          Text(
                            "Unit Code: CIS019",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 17),
                          ),
                          Text(
                            "Credit: 30",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
