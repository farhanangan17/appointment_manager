import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/od_services_screen.dart';
import 'app_drawer.dart';
import '../providers/auth.dart';


class BottomBar extends StatefulWidget {

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
            index: 0,
            icon: Icon(Icons.menu),
          ),
          buildTabItem(
            index: 1,
            icon: Icon(Icons.crop_square_outlined),
          ),
          placeholder,
          buildTabItem(
            index: 2,
            icon: Icon(Icons.receipt_outlined),
          ),
          buildTabItem(
            index: 3,
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    @required int index,
    @required Icon icon,
  }) {

    // final isSelected = index == widget.index;

    switch(index) {
      case 0:
        // print('zero!');
        return IconTheme(
          data: IconThemeData(
            color: Colors.black,
          ),
          child: IconButton(
            icon: icon,
            onPressed: () {
              Scaffold(
                drawer: AppDrawer(),
              );
            },
          ),
        );
        break; // The switch statement must be told to exit, or it will execute every case.
      case 1:
        // print('one!');
        return IconTheme(
          data: IconThemeData(
            color: Colors.black,
          ),
          child: IconButton(
            icon: icon,
            onPressed: () {
              Navigator.of(context).pushNamed(OdServicesScreen.routeName);
            }
          ),
        );
        break;
      case 2:
        // print('two!');
        return IconTheme(
          data: IconThemeData(
            color: Colors.black,
          ),
          child: IconButton(
            icon: icon,
            onPressed: () {
              Navigator.of(context).pushNamed(OdServicesScreen.routeName);
            }
          ),
        );
        break;
      case 3:
        // print('choose a different number!');
        return IconTheme(
          data: IconThemeData(
            color: Colors.black,
          ),
          child: IconButton(
            icon: icon,
            onPressed: () {
              // Navigator.of(context).pushNamed(OdServicesScreen.routeName);
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        );
        break;
    }


  }
}