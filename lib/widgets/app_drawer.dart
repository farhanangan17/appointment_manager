import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/reminder_screen.dart';




class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width * 0.5,
      // height: deviceSize.height,
      child: Column(
        children: <Widget>[
          AppBar(
            toolbarHeight: 100,
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.account_circle,
                size: 80,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  children: <Widget>[
                    Text('Credential line 1'),
                    Text('Credential line 2'),
                    Text('Credential line 3')
                  ],
                )
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: Icon(Icons.add_alert_outlined),
            title: Text('Reminders'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(ReminderScreen.routeName);
            }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.event_available),
              title: Text('My Appointments'),
              onTap: (){
                // Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
                // Navigator.of(context).pushReplacement(CustomRoute(builder: (ctx) => OrdersScreen()));
              }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.receipt_rounded),
              title: Text('Medical Records'),
              onTap: (){
                // Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
              }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.mail_outline_outlined),
              title: Text('Inbox'),
              onTap: (){
                // Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
              }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                // Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
              }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: (){
                // Navigator.of(context).pop();
                // Navigator.of(context).pushReplacementNamed('/');
                // Provider.of<Auth>(context).logout();
                // Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
              }
          ),
          // Divider(),
        ],
      ),
    );
  }
}
