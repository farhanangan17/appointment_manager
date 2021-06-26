import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Appointment with ChangeNotifier{
  String id;
  String date;
  String time;
  String docId;
  String name;
  String reason;
  String patientName;
  bool visited;

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