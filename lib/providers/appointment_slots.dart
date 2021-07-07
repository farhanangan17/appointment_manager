import 'package:flutter/material.dart';

import '../models/appointment_slot.dart';

class AppointmentSlots with ChangeNotifier{
  List<AppointmentSlot> _appSlotItems = [];

  List<AppointmentSlot> get items{
    return [..._appSlotItems];
  }

  void addAppointmentSlot(AppointmentSlot appointmentSlot){
    final newAppointmentSlot = AppointmentSlot(
      weekDayValue: appointmentSlot.weekDayValue,
      weekDayName: appointmentSlot.weekDayName,
      timeList: appointmentSlot.timeList,
    );
    _appSlotItems.add(newAppointmentSlot);
    notifyListeners();
  }
}