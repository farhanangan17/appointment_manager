import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/calendar.dart';
import '../screens/appointment_information_screen.dart';
import '../providers/doctor_credentials.dart';

class AppointmentScheduleScreen extends StatelessWidget {
  static const routeName = '/appointment_schedule_screen';

  Container cardButton(ctx, String str){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      child: Center(child: Text(str, style: TextStyle(color: Colors.white),)),
      height: 40,
      width: MediaQuery.of(ctx).size.width * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Theme.of(ctx).primaryColor,
            Theme.of(ctx).primaryColorLight,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          stops: [0,1],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final docId = routeArgs['id'];
    final _doctorProfile = Provider.of<DoctorCredentials>(context).findById(docId);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Appointment Schedule', style: Theme.of(context).textTheme.headline2,),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: deviceSize.height * 0.55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorLight,
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    stops: [0,1],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    height: deviceSize.height*0.47,
                    child: Calendar()
                  ),
                  // appointmentTimeSlider(),
                  Column(
                    children: <Widget>[
                      Text('Select a Time', style: TextStyle(fontSize: 12, color: Colors.white),),
                      Container(
                        height: 30,
                        child: ListView(
                          // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            TextButton(child: Text('09:30 AM'),),
                            TextButton(child: Text('10:30 AM'),),
                            TextButton(child: Text('11:30 AM'),),
                            TextButton(child: Text('12:30 AM'),),
                            TextButton(child: Text('02:30 AM'),),
                            // TextButton(onPressed: onPressed, child: child)
                          ],
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ]
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                  AppointmentInformationScreen.routeName,
                  arguments: {
                    'id': _doctorProfile.id
                  },
              );
            },
            // onTap: (){
            //   Navigator.of(context).pushNamed(
            //       AppointmentScheduleScreen.routeName,
            //       arguments: {'id': _doctorProfile.id,}
            //   );
            // },
            child: cardButton(context, 'Book Appointment'),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(_doctorProfile.doctorName, style: TextStyle(fontSize: 18),),
                Text(_doctorProfile.doctorTitle, style: TextStyle(fontSize: 14),),
                Padding(padding: EdgeInsets.only(bottom: 5),child: Text(_doctorProfile.address, style: TextStyle(fontSize: 14),)),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),child: Text('BDT ${_doctorProfile.visitAmount}', style: TextStyle(fontWeight: FontWeight.bold),)),
                    Container(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),child: Text('${_doctorProfile.yearsOfExp} yrs of exp.', style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.favorite_outlined, color: Colors.red,),
                          Text('${_doctorProfile.likes}', style: TextStyle(fontWeight: FontWeight.bold)),
                        ]
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
