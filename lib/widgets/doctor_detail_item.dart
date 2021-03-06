import 'package:flutter_html/flutter_html.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/doctor_credential.dart';
import '../screens/appointment_schedule_screen.dart';

enum selectButton{
  info, feedback
}

class DoctorDetailItem extends StatefulWidget {

  @override
  _DoctorDetailItemState createState() => _DoctorDetailItemState();
}

class _DoctorDetailItemState extends State<DoctorDetailItem> {
  selectButton _sb = selectButton.info;


  Container detailContainer(String title, String body){
    return Container(
      // height: MediaQuery.of(context).size.height*0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children:<Widget> [
                // Row(
                //   children:<Widget> [
                //     CircleAvatar(
                //       radius: 3,
                //     ),
                //     Padding(
                //         padding: EdgeInsets.only(left: 6),
                //         child: Text(
                //           '${body}',
                //         )
                //     )
                //   ]
                // ),
                Row(
                  children:<Widget> [
                    // CircleAvatar(
                    //   radius: 3,
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width *0.78,
                        padding: EdgeInsets.only(left: 6),
                        child: Html(
                          data: '${body}',
                        ),
                    )
                  ]
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Container cardButton(ctx, String str){
    return Container(
      child: Center(child: Text(str, style: TextStyle(color: Colors.white),)),
      height: 40,
      width: MediaQuery.of(ctx).size.width * .8,
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
    final _doctorProfile = Provider.of<DoctorCredential>(context);
    final deviceSize = MediaQuery.of(context).size;
    final String stringEdu = _doctorProfile.education;
    final String stringSpec = _doctorProfile.specialization;
    final String stringSer = _doctorProfile.services;

    return Container(
      // he: deviceSize.height*0.2,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      height: deviceSize.height *.52,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: deviceSize.height *0.05,
                width: deviceSize.width *0.46,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _sb == selectButton.info
                        ?Theme.of(context).primaryColorLight
                        :Colors.black12
                    )
                  )
                ),

                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _sb = selectButton.info;
                    });
                  },
                  child: Text(
                    'Doctor\'s Info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: _sb == selectButton.info
                          ?Theme.of(context).primaryColorLight
                          :Colors.black45
                    ),
                  ),
                ),
              ),
              Container(
                height: deviceSize.height *0.05,
                width: deviceSize.width *0.46,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: _sb == selectButton.feedback
                                ?Theme.of(context).primaryColorLight
                                :Colors.black12
                        )
                    )
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _sb = selectButton.feedback;
                    });
                  },
                  child: Text(
                    'Feedback',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: _sb == selectButton.feedback
                            ?Theme.of(context).primaryColorLight
                            :Colors.black45
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: deviceSize.height*0.37,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
            child: _sb == selectButton.info
              ? SingleChildScrollView(
                 child: Column(
                   children: <Widget>[
                     detailContainer('Education', stringEdu),
                     detailContainer('Specialization', stringSpec),
                     detailContainer('Services Offered', stringSer),
                   ],
                 ),
                )
              : Container(
                  child: Center(child: Text('FEEDBACK'),),
              )
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                AppointmentScheduleScreen.routeName,
                arguments: {'id': _doctorProfile.id,}
              );
            },
            child: cardButton(context, 'Book Appointment'),
          ),
        ],
      ),
    );
  }
}
