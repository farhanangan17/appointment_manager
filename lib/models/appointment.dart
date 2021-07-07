import 'package:flutter/material.dart';

class Appointment with ChangeNotifier{
  final String id;
  final String date;
  final String time;
  final String docId;
  final String name;
  final String reason;
  final String patientName;
  final bool visited;

  Appointment({
    @required this.id,
    @required this.date,
    @required this.time,
    @required this.docId,
    @required this.name,
    @required this.reason,
    @required this.patientName,
    @required this.visited,
  });
}