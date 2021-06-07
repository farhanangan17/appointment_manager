import 'package:appointment_manager/widgets/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/doctor_credentials.dart';
import '../widgets/doctor_detail_item.dart';
import '../widgets/bottom_bar.dart';

class DoctorDetailScreen extends StatelessWidget {
  static const routeName = '/doctor_detail_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final docId = routeArgs['id'];
    final doctorProfile = Provider.of<DoctorCredentials>(context).findById(docId);
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Doctor\'s Details', style: Theme.of(context).textTheme.headline2,),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  height: deviceSize.height*.27,
                  width: deviceSize.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColorLight,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0,1],
                    ),
                  ),
                ),
                Container(
                  height: deviceSize.height*0.27,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Text(
                                doctorProfile.doctorName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: deviceSize.height*0.03,
                                  backgroundColor: Theme.of(context).canvasColor,
                                  child: Icon(Icons.shield, color: Theme.of(context).primaryColorLight,),
                                ),
                                SizedBox(width: deviceSize.width * 0.03,),
                                // CircleAvatar(
                                //   radius: 30,
                                //   child: Image.asset(doctorProfile.imageUrl),
                                //
                                // ),
                                Container(
                                  width: deviceSize.width*0.2,
                                  height: deviceSize.height*0.1,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(doctorProfile.imageUrl),
                                        fit: BoxFit.contain
                                    ),
                                  ),
                                ),
                                SizedBox(width: deviceSize.width * 0.03,),
                                CircleAvatar(
                                  radius: deviceSize.height*0.03,
                                  backgroundColor: Theme.of(context).canvasColor,
                                  child: Icon(Icons.verified_user, color: Theme.of(context).primaryColorLight,),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Text(
                                doctorProfile.doctorTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              // width: deviceSize.width * .25,
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                              child: Text('BDT ${doctorProfile.visitAmount}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                          Container(
                              // width: deviceSize.width * .3,
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                              child:Text('${doctorProfile.yearsOfExp} yrs of exp', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                          Container(
                              // width: deviceSize.width * .3,
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                              child:Row(
                                children: <Widget>[
                                  Icon(Icons.favorite, color: Colors.red,),
                                  Text('${doctorProfile.likes}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ]
            ),
            ChangeNotifierProvider.value(
              value: doctorProfile,
              child: DoctorDetailItem(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
