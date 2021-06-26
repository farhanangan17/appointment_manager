import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/appointments.dart';
import '../widgets/appointment_list_item.dart';

enum selectedButton {
  allApp, upcomingApp
}

class AppointmentListScreen extends StatefulWidget {
  static const routeName = '/appointment_list_screen';


  @override
  _AppointmentListScreenState createState() => _AppointmentListScreenState();
}

class _AppointmentListScreenState extends State<AppointmentListScreen> {
  selectedButton _sb = selectedButton.allApp;
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    final _appDetails = Provider.of<Appointments>(context).items;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Appointment List', style: Theme.of(context).textTheme.headline2,),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        height: deviceSize.height *.9,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: deviceSize.height *0.07,
                  width: deviceSize.width *0.5,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _sb == selectedButton.allApp
                          ?Theme.of(context).primaryColorLight
                          :Colors.black12
                      )
                    )
                  ),
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        _sb = selectedButton.allApp;
                      });
                    },
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _sb == selectedButton.allApp
                          ?Theme.of(context).primaryColorLight
                          :Colors.black45
                      ),
                    ),
                  ),
                ),
                Container(
                  height: deviceSize.height *0.07,
                  width: deviceSize.width *0.5,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _sb == selectedButton.upcomingApp
                          ?Theme.of(context).primaryColorLight
                          :Colors.black12
                      )
                    )
                  ),
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        _sb = selectedButton.upcomingApp;
                      });
                    },
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _sb == selectedButton.upcomingApp
                          ?Theme.of(context).primaryColorLight
                          :Colors.black45
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: deviceSize.height*0.78,
              decoration: BoxDecoration(

              ),
              child: _sb == selectedButton.allApp
                ? Container(
                    // height: 600,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) {
                        if(DateFormat.yMMMd('en_US').parse(_appDetails[i].date).isBefore(DateTime.now()) || DateFormat.jm().parse(_appDetails[i].time).isBefore(DateTime.now())){
                          return Column(
                              children: <Widget>[
                                Container(
                                    child: Text('Completed')
                                ),
                                ListView.builder(
                                    itemBuilder:(ctx, i) {
                                      return ChangeNotifierProvider.value(
                                          value: _appDetails[i],
                                          child: AppointmentListItem()
                                      );
                                    },
                                    shrinkWrap: true,
                                    itemCount: _appDetails.length,
                                ),

                              ]
                          );
                        }
                        else{
                          return ChangeNotifierProvider.value(
                              value: _appDetails[i],
                              child: AppointmentListItem()
                          );
                        }
                      },
                      itemCount: 1
                      // _appDetails.length,
                    ),
                  )
                : Container(
                    child: Center(child: Text('Upcoming Appointments'),),
                  )
            ),
          ],
        ),
      ),
    );
  }
}
