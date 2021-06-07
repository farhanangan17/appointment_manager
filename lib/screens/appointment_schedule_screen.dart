import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/calendar.dart';
import '../screens/appointment_information_screen.dart';
import '../providers/doctor_credentials.dart';
import '../models/appointment.dart';

class AppointmentScheduleScreen extends StatefulWidget {
  static const routeName = '/appointment_schedule_screen';

  @override
  _AppointmentScheduleScreenState createState() => _AppointmentScheduleScreenState();
}

class _AppointmentScheduleScreenState extends State<AppointmentScheduleScreen> {

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  Container cardButton(ctx, String str, Size deviceSize){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: deviceSize.height*0.02),
      child: Center(child: Text(str, style: TextStyle(color: Colors.white),)),
      height: MediaQuery.of(ctx).size.height*0.06,
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
    var _tempApp = Appointment(
        id: DateTime.now().toString(),
        date: '',
        time: '',
        docId: docId,
        name: '',
        reason: '',
        patientName: '',
    );

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
                height: deviceSize.height * 0.51,
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
                    height: deviceSize.height*0.43,
                    child: TableCalendar(
                      rowHeight: deviceSize.height*0.05,
                      focusedDay: selectedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2050),
                      calendarFormat: format,
                      // onFormatChanged: (CalendarFormat _format) {
                      //   setState(() {
                      //     format = _format;
                      //   });
                      // },
                      // startingDayOfWeek: StartingDayOfWeek.sunday,
                      // daysOfWeekVisible: true,

                      //Day Changed
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                          _tempApp.date = DateFormat.yMMMMd('en_US').format(focusDay);
                        });
                        // _tempApp.date = DateFormat.yMMMMd('en_US').format(focusedDay);

                        // print(_tempApp.date);
                        // print(_tempApp.docId);
                      },
                      onPageChanged: (focusDay) {
                        focusedDay = focusDay;
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },

                      // eventLoader: _getEventsfromDay,

                      //To style the Calendar
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        defaultTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        weekendTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                        leftChevronPadding: EdgeInsets.only(left: 80),
                        rightChevronPadding: EdgeInsets.only(right: 80),
                        titleTextFormatter: (date, locale) => DateFormat.MMMM(locale).format(date),
                        titleTextStyle: TextStyle(color: Colors.white),
                        formatButtonVisible: false,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        headerPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      ),
                    ),
                  ),
                  // appointmentTimeSlider(),
                  Column(
                    children: <Widget>[
                      Text('Select a Time', style: TextStyle(fontSize: 12, color: Colors.white),),
                      Container(
                        height: deviceSize.height*0.05,
                        child: ListView(
                          // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            TextButton(
                              child: Text('09:30 AM'),
                              onPressed: (){
                                _tempApp.time = DateFormat.jm().format(DateTime(0, 0, 0, 09, 30));
                                print(_tempApp.time);
                                print(_tempApp.date);
                                // print(_tempApp.docId);
                                },
                            ),
                            TextButton(child: Text('10:30 AM'),),
                            TextButton(child: Text('11:30 AM'),),
                            TextButton(child: Text('12:30 PM'),),
                            TextButton(child: Text('02:30 PM'),),
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
                    'appId': _tempApp.id,
                    'id': _doctorProfile.id,
                    'date': _tempApp.date,
                    'time': _tempApp.time,
                    // 'name': _tempApp.name,
                    // 'reasons': _tempApp.reason,
                    // 'patientName': _tempApp.patientName,
                  },
              );
            },
            child: cardButton(context, 'Book Appointment', deviceSize),
          ),
          Container(
            height: deviceSize.height*0.15,
            child: Column(
              children: <Widget>[
                Text(_doctorProfile.doctorName, style: TextStyle(fontSize: deviceSize.height*0.025, fontWeight: FontWeight.bold),),
                Text(_doctorProfile.doctorTitle, style: TextStyle(fontSize: deviceSize.height*0.021),),
                Padding(padding: EdgeInsets.only(bottom: 5),child: Text(_doctorProfile.address, style: TextStyle(fontSize: deviceSize.height*0.021),)),
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
