import 'package:flutter/material.dart';

import '../main.dart';

class BottomBar extends StatelessWidget {

  BottomNavigationBarItem _bottomNavigationBarItem(ctx, Icon icon){
    return BottomNavigationBarItem(
      // backgroundColor: Theme.of(ctx).primaryColorDark,
      icon: icon,
      label: ('a'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (_){},
      items: [
        _bottomNavigationBarItem(
          context,
          Icon(
            Icons.view_headline,
            size: 30,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        _bottomNavigationBarItem(
          context,
          Icon(
            Icons.grid_view,
            size: 30,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        _bottomNavigationBarItem(
          context,
          Icon(
            Icons.home,
            size: 30,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        _bottomNavigationBarItem(
          context,
          Icon(
            Icons.list_alt,
            size: 30,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        _bottomNavigationBarItem(
          context,
          Icon(
            Icons.account_circle,
            size: 30,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ],
    );
  }
}
