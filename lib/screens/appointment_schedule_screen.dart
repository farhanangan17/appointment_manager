import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/appointment_schedule_item.dart';
import '../screens/appointment_information_screen.dart';
import '../providers/doctor_credentials.dart';
import '../models/appointment.dart';

class AppointmentScheduleScreen extends StatefulWidget {
  static const routeName = '/appointment_schedule_screen';

  @override
  _AppointmentScheduleScreenState createState() => _AppointmentScheduleScreenState();
}

class _AppointmentScheduleScreenState extends State<AppointmentScheduleScreen> {
  var _showSlot = false;
  int weekDayValue, slotLength;
  List<dynamic> slotList;

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  // List<Region> _region = [];
  // String selectedRegion;

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
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final docId = routeArgs['id'];
    final scheduleSlot = routeArgs['schedule'];
    final convScheduleSlot = json.decode(scheduleSlot);

    // _region = (convScheduleSlot).map<Region>((item) => Region.fromJson(item)).toList();
    // selectedRegion = _region[0].weekDayName;

    final _doctorProfile = Provider.of<DoctorCredentials>(context).findById(docId);
    final deviceSize = MediaQuery.of(context).size;

    // final List<String> some = List<String>.from(convScheduleSlot[1]['timeList']);

    // final findTimeSlot = Provider.of<DoctorCredentials>(context).addAppointmentSlot(_doctorProfile);
    // final _appSlotList = Provider.of<DoctorCredentials>(context).slotItems;
    // final scheduleData = json.decode(_doctorProfile.schedule);
    // final timingList = scheduleData[1]['timeList'] as List<dynamic>;

    var _tempApp = Appointment(
      id: DateTime.now().toString(),
      date: '',
      time: '',
      docId: docId,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Appointment Schedule', style: Theme.of(context).textTheme.headline2,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: deviceSize.height * 0.4,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  height: deviceSize.height*0.43,
                  child: TableCalendar(
                    rowHeight: deviceSize.height*0.05,
                    focusedDay: selectedDay,
                    firstDay: DateTime(1, 1, 2000),
                    // DateTime.now().subtract(Duration(days: 0)),
                    lastDay: DateTime.now().add(Duration(days: 31)),
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
                      // setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                      // _tempApp.date = DateFormat.yMMMMd('en_US').format(selectedDay);
                      _tempApp = Appointment(
                        id: _tempApp.id,
                        date: DateFormat.yMMMMd('en_US').format(selectedDay),
                        time: _tempApp.time,
                        docId: docId,
                      );

                      print(_tempApp.date);
                      print(_tempApp.time);
                    },
                    onPageChanged: (focusDay) {
                      focusedDay = focusDay;
                    },
                    // enabledDayPredicate: (DateTime enDay) {
                    //   for(var i =0; i<7; ++i){
                    //     final asdf = convScheduleSlot[i]['timeList'] as List<dynamic>;
                    //     asdf.isEmpty == true
                    //     // _appSlotList[i].weekDayValue
                    //         ? false
                    //         : true;
                    //   }
                    // },

                    selectedDayPredicate: (DateTime date){
                      return isSameDay(selectedDay, date);
                    //   date.weekday == 5 || date.weekday == 6
                    //       ? false
                    //       : true,
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
              ]
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight),
                            ),
                            onPressed: (){
                              weekDayValue = focusedDay.weekday;
                              for(var j = 0; j<7; ++j){
                                if(convScheduleSlot[j]['value'] == focusedDay.weekday){
                                  slotList = convScheduleSlot[j]['timeList'] as List<dynamic>;
                                  slotLength = slotList.length;
                                  break;
                                }else {slotLength = 0;}
                              }
                              setState(() {
                                _tempApp.date.isEmpty
                                    ? _showSlot = false
                                    : _showSlot = true;
                              });
                              print(slotLength);
                              print(_tempApp.date);
                            },
                            child: Text('Find Appointment Slot for: ')
                          // _tempApp.date.isEmpty
                          // ?Text('Find Appointment Slot for --/--/----')
                          // :Text('Find Appointment Slot for ${_tempApp.date}'),
                        ),
                        SizedBox(width: 15,),
                        _showSlot == false
                          ? Text('--/--/----')
                          : Text(focusedDay.toString())
                      ],
                    ),
                    _showSlot == false
                    ? Container(height: deviceSize.height*0.2, padding: EdgeInsets.symmetric(vertical: 50), child: Text('Choose a date to see available slots for your appointment!', textAlign: TextAlign.center,),)
                    : Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        height: deviceSize.height*0.2,
                        child: slotLength != 0
                        ? GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height / 7),
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                          ),
                          itemCount: slotLength,
                          itemBuilder: (ctx, i){
                            for(int a=i; a<slotLength;){
                              return ElevatedButton(
                                onPressed: (){
                                  _tempApp = Appointment(
                                    id: _tempApp.id,
                                    date: DateFormat.yMMMMd('en_US').format(selectedDay),
                                    time: slotList[a],
                                    docId: docId,
                                  );
                                  // _tempApp.time = DateFormat.jm(slotList[i]).toString();
                                  print(_tempApp.date);
                                  print(_tempApp.time);
                                },
                                child: Text(slotList[a]),
                              );
                            }
                          },
                        )
                        : Center(
                          child: Text('No available slot for today! Try another day.'),
                        )
                    ),
                  ]
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: (){
                  print('${_tempApp.date} 000');
                  Navigator.of(context).pushNamed(
                      AppointmentInformationScreen.routeName,
                      arguments: {
                        'appId': _tempApp.id,
                        'id': _doctorProfile.id,
                        'date': _tempApp.date,
                        'time': _tempApp.time,
                      },
                  );
                },
                child: cardButton(context, 'Book Appointment', deviceSize),
              ),
            ),
            // Container(
            //   height: deviceSize.height*0.15,
            //   child: Column(
            //     children: <Widget>[
            //       Text(_doctorProfile.doctorName, style: TextStyle(fontSize: deviceSize.height*0.025, fontWeight: FontWeight.bold),),
            //       Text(_doctorProfile.doctorTitle, style: TextStyle(fontSize: deviceSize.height*0.021),),
            //       Padding(padding: EdgeInsets.only(bottom: 5),child: Text('${_doctorProfile.organization}, ${_doctorProfile.orgAddress}', style: TextStyle(fontSize: deviceSize.height*0.021),)),
            //       Row(
            //         // crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           Container(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),child: Text('BDT ${_doctorProfile.visitAmount}', style: TextStyle(fontWeight: FontWeight.bold),)),
            //           Container(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),child: Text('${_doctorProfile.yearsOfExp} yrs of exp.', style: TextStyle(fontWeight: FontWeight.bold))),
            //           Padding(
            //             padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //             child: Row(
            //               children: <Widget>[
            //                 Icon(Icons.favorite_outlined, color: Colors.red,),
            //                 Text('${_doctorProfile.likes}', style: TextStyle(fontWeight: FontWeight.bold)),
            //               ]
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: Icon(Icons.home),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// class Region {
//   final int weekDayValue;
//   final String weekDayName;
//   // final List<String> timeList;
//
//   Region({this.weekDayValue, this.weekDayName,});
//   factory Region.fromJson(Map<String, dynamic> json) {
//     return new Region(
//       weekDayValue: json['value'],
//       weekDayName: json['name'],
//       // timeList: json['timeList'],
//     );
//   }
// }
