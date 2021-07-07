import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/doctor_credential.dart';
import '../models/appointment_slot.dart';
import '../providers/doctor_credentials.dart';
import '../providers/appointment_slots.dart';
import '../screens/doctor_detail_screen.dart';
import '../screens/appointment_schedule_screen.dart';

class MedicalRecordItem extends StatelessWidget {

//   @override
//   _MedicalRecordItemState createState() => _MedicalRecordItemState();
// }
//
// class _MedicalRecordItemState extends State<MedicalRecordItem> {
  Container cardButton(ctx, String str){
    return Container(
      child: Center(child: Text(str, style: TextStyle(color: Colors.white),)),
      height: 40,
      width: MediaQuery.of(ctx).size.width * .4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Theme.of(ctx).primaryColor,
            Theme.of(ctx).primaryColorLight,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          stops: [0,1],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayedDoctors = Provider.of<DoctorCredential>(context);
    final membershipData = json.decode(displayedDoctors.membership);

    // final findTimeSlot = Provider.of<DoctorCredentials>(context).addAppointmentSlot(displayedDoctors);
    // final _appSlotList = Provider.of<DoctorCredentials>(context).slotItems;

    // final scheduleData = json.decode(displayedDoctors.schedule);
    // final timingList = scheduleData[0]['timeList'] as List<dynamic>;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(displayedDoctors.imageUrl),
                      fit: BoxFit.contain
                  ),
                ),
              ),
              title: Text(displayedDoctors.doctorName, style: Theme.of(context).textTheme.headline4,),
              subtitle: Text(
                '${displayedDoctors.doctorTitle}, ${membershipData},\n'
                // '${scheduleData[1]['timeList'][0]} '
                // '${timingList.length}'
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      child: Text('BDT ${displayedDoctors.visitAmount}', style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      child:Text('${displayedDoctors.yearsOfExp} yrs of exp', style: TextStyle(fontWeight: FontWeight.bold),)),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      child:Row(
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.red,),
                          Text('${displayedDoctors.likes}', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pushNamed(
                    DoctorDetailScreen.routeName,
                    arguments: {'id': displayedDoctors.id},
                );

              },
              child: Text('VIEW PROFILE', style: Theme.of(context).textTheme.headline3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(
                        DoctorDetailScreen.routeName,
                        arguments: {
                          'id': displayedDoctors.id,
                        },
                      );
                    },
                    child: cardButton(context, 'Profile'),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .055,),
                  GestureDetector(
                    onTap: (){
                      // print('${_appSlotList[1].weekDayValue} slotting data');
                      // findTimeSlot;
                      Navigator.of(context).pushNamed(
                          AppointmentScheduleScreen.routeName,
                          arguments: {'id': displayedDoctors.id, 'schedule': displayedDoctors.schedule}
                      );
                    },
                    child: cardButton(context, 'Book'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
