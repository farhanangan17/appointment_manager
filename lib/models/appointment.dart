import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Appointment with ChangeNotifier{
  final String id;
  final DateTime date;
  // final DateTime time;
  final String docId;
  final String name;
  final String reason;
  final String patientName;

  Appointment({
    @required this.id,
    @required this.date,
    // @required this.time,
    @required this.docId,
    @required this.name,
    @required this.reason,
    @required this.patientName,
  });
}