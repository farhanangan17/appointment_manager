import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:date_format/date_format.dart';

import '../models/appointment.dart';

class Appointments with ChangeNotifier{
  List<Appointment> _appointments = [
    Appointment(
      id: 'app1',
      date: DateFormat.yMMMd().format(DateTime(2021, 11, 9)),
      time: DateFormat.jm().format(DateTime(0, 0, 0, 20, 50)),
      docId: 'd4',
      name: 'Farhan',
      reason: 'Headache',
      patientName: 'Farhan',
    ),
    Appointment(
      id: 'app2',
      date: DateFormat.yMMMd().format(DateTime(2021, 3, 9)),
      time: DateFormat.jm().format(DateTime(0, 0, 0, 20, 50)),
      docId: 'd4',
      name: 'Farhan',
      reason: 'Headache',
      patientName: 'Farhan',
    ),
    Appointment(
      id: 'app2',
      date: DateFormat.yMMMd().format(DateTime(2021, 3, 9)),
      time: DateFormat.jm().format(DateTime(0, 0, 0, 20, 50)),
      docId: 'd4',
      name: 'Farhan',
      reason: 'Headache',
      patientName: 'Farhan',
    ),
  ];

  List<Appointment> get items{
    return [..._appointments];
  }

  void addAppointment(Appointment appointment){
    final newAppointment = Appointment(
        id: DateTime.now().toString(),
        date: appointment.date,
        docId: appointment.docId,
        name: appointment.name,
        reason: appointment.reason,
        patientName: appointment.patientName
    );
    _appointments.add(newAppointment);
    notifyListeners();
  }
}