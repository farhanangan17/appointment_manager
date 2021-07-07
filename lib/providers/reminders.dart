import 'package:flutter/material.dart';

import '../models/reminder.dart';

class Reminders with ChangeNotifier{
  List<Reminder> _reminderItems = [];

  List<Reminder> get items{
    return [..._reminderItems];
  }

  void addReminder(Reminder reminder){
    final newReminder = Reminder(
      reminderId: DateTime.now().toString(),
      drugName: reminder.drugName,
      concern: reminder.concern,
      dosage: reminder.dosage,
      docName: reminder.docName,
      startDate: reminder.startDate,
      endDate: reminder.endDate,
      time: reminder.time,
    );
    _reminderItems.add(newReminder);
    notifyListeners();
  }
}