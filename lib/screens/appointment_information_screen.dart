import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../providers/doctor_credentials.dart';
import 'appointment_payment_screen.dart';
import '../models/appointment.dart';

class AppointmentInformationScreen extends StatefulWidget {
  static const routeName = '/appointment_information_screen';

  @override
  _AppointmentInformationScreenState createState() => _AppointmentInformationScreenState();
}

class _AppointmentInformationScreenState extends State<AppointmentInformationScreen> {
  var _visited = false;

  Widget textFieldContainer(BuildContext ctx, String title, Size deviceSize){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: deviceSize.height*0.02, bottom: deviceSize.height*0.01),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(ctx).primaryColorLight
            ),
          ),
        ),
        Container(
          height: deviceSize.height*0.06,
          child: TextFormField(
            // style: TextFormS,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                // focusColor: Theme.of(context).primaryColorLight,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(ctx).primaryColorLight
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
              )
          ),
        ),
      ]
    );
  }

  Container cardButton(ctx, String str, Size deviceSize){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: deviceSize.height*0.01),
      child: Center(
          child: Text(str, style: TextStyle(color: Colors.white),)
      ),
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
    final deviceSize = MediaQuery.of(context).size;
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final appId = routeArgs['appId'];
    final docId = routeArgs['id'];
    final appDate = routeArgs['date'];
    final appTime = routeArgs['time'];

    final _doctorProfile = Provider.of<DoctorCredentials>(context).findById(docId);

    var _tempApp = Appointment(
      id: appId,
      date: appDate,
      time: appTime,
      docId: docId,
      name: '',
      reason: '',
      patientName: '',
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Appointment information', style: Theme.of(context).textTheme.headline2,),
      ),
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        height: deviceSize.height *0.9,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: deviceSize.height*0.02),
                    height: deviceSize.height*0.03,
                    child: Text('--------Progress Bar-------'),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(_doctorProfile.doctorName, style: TextStyle(fontSize: 18),),
                        Text(_doctorProfile.doctorTitle, style: TextStyle(fontSize: 14),),
                        Padding(padding: EdgeInsets.only(bottom: 5),child: Text(_doctorProfile.address, style: TextStyle(fontSize: 14),)),
                        Divider(
                          height: 20,
                          thickness: 1,
                          indent: 70,
                          endIndent: 70,
                        ),
                        Container(child: Row(children: <Widget>[Text(appDate.toString()), Text(_tempApp.time.toString())]))
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                    // height: deviceSize.height *0.33,
                    child: Column(
                      children: <Widget>[
                        textFieldContainer(context, 'Your Name', deviceSize),
                        textFieldContainer(context, 'Reason For Visit', deviceSize),
                        textFieldContainer(context, 'Patient Name', deviceSize),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: deviceSize.height*0.015),
                child: Row(
                    children: <Widget>[
                      Checkbox(
                        // splashRadius: ,
                        value: _visited,
                        onChanged: (val){
                          setState(() {
                            _visited = val;
                          });
                        },
                        activeColor: Theme.of(context).primaryColorLight,
                      ),
                      Text('I have visited this doctor before', style: TextStyle(color: Theme.of(context).primaryColorLight),)
                    ]
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(
                    AppointmentPaymentScreen.routeName,
                    arguments: {
                      'amount': _doctorProfile.visitAmount,
                    }
                  );
                },
                  child: cardButton(context, 'Next', deviceSize)
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
