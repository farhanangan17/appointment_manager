// import 'package:calendar/event.dart';
import 'package:appointment_manager/screens/homepage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../models/appointment.dart';

class Calendar extends StatefulWidget {

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    // selectedEvents = {};
    super.initState();
  }

  // List<Event> _getEventsfromDay(DateTime date) {
  //   return selectedEvents[date] ?? [];
  // }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return
      // Column(
      //   children: [
          // Container(
            // height: deviceSize.height * 0.4,
            TableCalendar(

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
                });
                //print(tempApp);
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
            );
          // ),
          // ..._getEventsfromDay(selectedDay).map(
          //       (Event event) => ListTile(
          //     title: Text(
          //       event.title,
          //     ),
          //   ),
          // ),
      //   ],
      // );
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: Text("Add Event"),
      //       content: TextFormField(
      //         controller: _eventController,
      //       ),
      //       actions: [
      //         TextButton(
      //           child: Text("Cancel"),
      //           onPressed: () => Navigator.pop(context),
      //         ),
      //         TextButton(
      //           child: Text("Ok"),
      //           onPressed: () {
      //             if (_eventController.text.isEmpty) {
      //
      //             } else {
      //               if (selectedEvents[selectedDay] != null) {
      //                 selectedEvents[selectedDay].add(
      //                   Event(title: _eventController.text),
      //                 );
      //               } else {
      //                 selectedEvents[selectedDay] = [
      //                   Event(title: _eventController.text)
      //                 ];
      //               }
      //
      //             }
      //             Navigator.pop(context);
      //             _eventController.clear();
      //             setState((){});
      //             return;
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      //   label: Text("Add Event"),
      //   icon: Icon(Icons.add),
      // ),
    // );
  }
}
