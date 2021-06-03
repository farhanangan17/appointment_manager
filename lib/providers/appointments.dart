import 'package:flutter/material.dart';

import '../models/appointment.dart';

class Appointments with ChangeNotifier{
  List<Appointment> _appointments = [
    Appointment(
      id: 'app1',
      date: DateTime(2021, 1, 2, 09, 30),
      // time: DateTime(0,0,0, 09, 30),
      docId: 'd4',
      name: 'Farhan',
      reason: 'Headache',
      patientName: 'Farhan',
    ),
    Appointment(
      id: 'app2',
      date: DateTime(2021, 1, 2, 09, 30),
      // time: DateTime(0,0,0, 09, 30),
      docId: 'd4',
      name: 'Farhan',
      reason: 'Headache',
      patientName: 'Farhan',
    ),
  ];
}