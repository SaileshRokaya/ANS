//import 'package:ans/fees/fees_form.dart';
import 'package:ans/fees/fees_list.dart';
import 'package:ans/leaves/leave_form.dart';
import 'package:ans/leaves/leave_list.dart';
import 'package:ans/views/login.dart';
import 'package:flutter/material.dart';

class MenuBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/Academic.png'))),
          ),

          // leave request form is here
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Leave Request Form'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LeaveList())),
            },
          ),

          // fees request form is here
          ListTile(
            leading: Icon(Icons.money),
            title: Text('Fees Request Form'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FeeList())),
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login())),
            },
          ),
        ],
      ),
    );
  }
}
