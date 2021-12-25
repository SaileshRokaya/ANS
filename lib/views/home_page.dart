import 'package:flutter/material.dart';
import 'package:ans/views/mysubject.dart';
import 'package:ans/views/home_grid.dart';
import 'package:ans/views/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 75),
              child: Title(color: Colors.blue, child: Text("DASHBOARD")),
            ),
            InkWell(
              child: CircleAvatar(
                radius: 25.0,
                // backgroundImage:
                //     NetworkImage("${snapshot.data.hitsList[index].previewUrl}"),
                backgroundColor: Colors.cyanAccent,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
            )
          ],
        ),
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(10.0),

            // Call home grid method to show grid view of the home page
            child: HomeGrid()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
