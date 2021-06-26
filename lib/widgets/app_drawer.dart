import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';



class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Theme.of(context).primaryColorLight,
                ),
                Column(
                  children: <Widget>[
                    Text('Credential line 1'),
                    Text('Credential line 2'),
                    Text('Credential line 3')
                  ],
                )
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
              leading: Icon(Icons.add_alert_outlined),
              title: Text('Reminders'),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/');
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
          Divider(),
        ],
      ),
    );
  }
}
