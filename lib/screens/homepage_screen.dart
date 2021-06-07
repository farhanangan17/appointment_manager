import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../screens/find_doctor_screen.dart';
import '../screens/od_services_screen.dart';

enum onTapValue{findDoctor, ODservice, findAmbulance, faq}

class HomepageScreen extends StatelessWidget {
  static const routeName = '/';

  onTapValue _onTapped;

  // void shadeAngles(int val){
  //     switch(val){
  //       case 1: {
  //         end: Alignment.bottomRight;
  //         begin: Alignment.topLeft;
  //       }
  //       break;
  //       case 2: {
  //         end: Alignment.bottomRight;
  //         begin: Alignment.topLeft;
  //       }
  //       break;
  //       case 3: {
  //         end: Alignment.bottomRight;
  //         begin: Alignment.topLeft;
  //       }
  //       break;
  //       case 4: {
  //         end: Alignment.bottomRight;
  //         begin: Alignment.topLeft;
  //       }
  //       break;
  //     }
  // }

  GestureDetector gridContainer(onTapValue otv, ctx, Icon icon, String gridTitle, int val){
    return GestureDetector(
      onTap: (){
      //  use enum to select particular grid
        if(otv == onTapValue.findDoctor){
          // print();
          Navigator.of(ctx).pushNamed(
            FindDoctorScreen.routeName,
          );
        }
        if(otv == onTapValue.ODservice){
          // print();
          Navigator.of(ctx).pushNamed(
            OdServicesScreen.routeName,
          );
        }

      },
      child: Container(
        height: MediaQuery.of(ctx).size.height*0.5,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Theme.of(ctx).primaryColor,
              Theme.of(ctx).primaryColorLight,
            ],
            // (_) => shadeAngles(val),
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
            stops: [0,1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(height: 10),
            Text(
              gridTitle,
              style: Theme.of(ctx).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children:<Widget>[
          Container(
            height: deviceSize.height*1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorLight,
                  // Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  // Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                stops: [0,1],
              ),
            ),
          ),
          Column(
            children:<Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 0),
                child: Container(
                  height: deviceSize.height*0.35,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text('SLIDER', style: Theme.of(context).textTheme.headline1),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.symmetric(horizontal: deviceSize.width*0.07, vertical: deviceSize.height*0.07),
                  childAspectRatio: (deviceSize.height)*0.002,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    gridContainer(
                        _onTapped = onTapValue.findDoctor,
                        context,
                        Icon(
                          Icons.local_hospital,
                          size: 55,
                          color: Theme.of(context).canvasColor,
                        ),
                        'Find Doctors',
                        1
                    ),
                    gridContainer(
                        _onTapped = onTapValue.ODservice,
                        context,
                        Icon(
                          Icons.local_hospital,
                          size: 55,
                          color: Theme.of(context).canvasColor,
                        ),
                        'On Demand Services',2
                    ),
                    gridContainer(
                        _onTapped = onTapValue.findAmbulance,
                        context,
                        Icon(
                          Icons.local_hospital,
                          size: 55,
                          color: Theme.of(context).canvasColor,
                        ),
                        'Find Ambulance', 3
                    ),
                    gridContainer(
                        _onTapped = onTapValue.faq,
                        context,
                        Icon(
                          Icons.local_hospital,
                          size: 55,
                          color: Theme.of(context).canvasColor,
                        ),
                        'Help & FAQ', 4
                    ),
                  ],
                ),
              ),
            ]

          ),

        ]
      ),
      bottomNavigationBar: Container(height: 65, child: BottomBar()),
    );
  }
}
