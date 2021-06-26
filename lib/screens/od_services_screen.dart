import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';


enum onTapValue{findCaregiver, sampleCollection, medicalEquip, medicalAssist, physicalAssist, babyCareAssistance}

class OdServicesScreen extends StatelessWidget {
  static const routeName = '/od_services_screen';
  onTapValue _onTapped;

  GestureDetector gridContainer(onTapValue otv, ctx, Icon icon, String gridTitle,){
    return GestureDetector(
      onTap: (){
        //  use enum to select particular grid
        // if(otv == onTapValue.findDoctor){
        //   // print();
        //   Navigator.of(ctx).pushNamed(
        //     FindDoctorScreen.routeName,
        //   );
        // }
      },
      child: Container(
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('On Demand Services', style: Theme.of(context).textTheme.headline2,),
      ),
      body: Container(
        height: deviceSize.height*0.9,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        // child: Expanded(
          child: GridView.count(
            childAspectRatio: 3/2.5,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: <Widget>[
              gridContainer(
                  _onTapped = onTapValue.findCaregiver,
                  context,
                  Icon(
                    Icons.local_hospital,
                    size: 55,
                    color: Theme.of(context).canvasColor,
                  ),
                  'Find Caregiver',
              ),
              gridContainer(
                  _onTapped = onTapValue.sampleCollection,
                  context,
                  Icon(
                    Icons.local_hospital,
                    size: 55,
                    color: Theme.of(context).canvasColor,
                  ),
                  'Sample Collection',
              ),
              gridContainer(
                  _onTapped = onTapValue.medicalEquip,
                  context,
                  Icon(
                    Icons.local_hospital,
                    size: 55,
                    color: Theme.of(context).canvasColor,
                  ),
                  'Medical Equipment',
              ),
              gridContainer(
                  _onTapped = onTapValue.medicalAssist,
                  context,
                  Icon(
                    Icons.local_hospital,
                    size: 55,
                    color: Theme.of(context).canvasColor,
                  ),
                  'Medical Assistance',
              ),
              gridContainer(
                  _onTapped = onTapValue.physicalAssist,
                  context,
                  Icon(
                    Icons.local_hospital,
                    size: 55,
                    color: Theme.of(context).canvasColor,
                  ),
                  'Physical Assistance',
              ),
              gridContainer(
                  _onTapped = onTapValue.babyCareAssistance,
                  context,
                  Icon(
                    Icons.local_hospital,
                    size: 55,
                    color: Theme.of(context).canvasColor,
                  ),
                  'Baby Care Assistance',
              ),
            ],
          ),
        // ),
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: Icon(Icons.home),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
