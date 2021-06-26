import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:date_format/date_format.dart';

import '../models/appointment.dart';
import '../screens/appointment_list_screen.dart';
import '../providers/doctor_credentials.dart';


class AppointmentListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appDetails = Provider.of<Appointment>(context);
    final _doc = Provider.of<DoctorCredentials>(context).findById(_appDetails.docId);
    // final _dateString = DateFormat.MMMM('en_US').parse(_appDetails.date).toString();

    return SingleChildScrollView(
      child: DateFormat.yMMMd('en_US').parse(_appDetails.date).isAfter(DateTime.now()) || DateFormat.jm().parse(_appDetails.time).isAfter(DateTime.now())
        ? Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.add_alert, color: Theme.of(context).primaryColorLight,),
                title: Text('${_appDetails.date} at ${_appDetails.time}'),
                subtitle: Text('Upcoming appointment for ${_appDetails.reason} with ${_doc.doctorName}'),
                trailing: Icon(Icons.verified_sharp),
              ),
              Divider(thickness: 1,)
            ]
          )
        : Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.add_alert, color: Theme.of(context).primaryColorLight,),
                title: Text('${_appDetails.date} at ${_appDetails.time}'),
                subtitle: Text('Upcoming appointment for ${_appDetails.reason} with ${_doc.doctorName}'),
                trailing: Icon(Icons.verified_sharp, color: Colors.greenAccent,),
              ),
              Divider(thickness: 1,)
            ]
          ),
    );
  }
}
