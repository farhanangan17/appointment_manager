import 'package:flutter/material.dart';

class AppointmentSlot with ChangeNotifier{
  final int weekDayValue;
  final String weekDayName;
  final List<dynamic> timeList;

  AppointmentSlot({
    @ required this.weekDayValue,
    @ required this.weekDayName,
    @ required this.timeList,
  });
}