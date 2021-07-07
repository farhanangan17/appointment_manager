import 'package:flutter/material.dart';

class Reminder with ChangeNotifier{
  final String reminderId;
  final String drugName;
  final String concern;
  final String dosage;
  final String docName;
  final String startDate;
  final String endDate;
  final String time;

  Reminder({
    @required this.reminderId,
    @required this.drugName,
    @required this.concern,
    @required this.dosage,
    @required this.docName,
    @required this.startDate,
    @required this.endDate,
    @required this.time,
  });
}