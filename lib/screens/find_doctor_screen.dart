import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../providers/doctor_categories.dart';
import '../widgets/find_doctor_item.dart';
import 'medical_records_screen.dart';

class FindDoctorScreen extends StatelessWidget {
  static const routeName = '/FindDocScreen';

  @override
  Widget build(BuildContext context) {
    final doctorCategories = Provider.of<DoctorCategories>(context).items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Find Doctors', style: Theme.of(context).textTheme.headline2,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: TextFormField(
                style: TextStyle(color: Colors.black ),
                decoration: InputDecoration(
                  fillColor: HexColor('#e1e1dd'),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: HexColor('#e1e1dd'), width: 0.0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#e1e1dd'), width: 0.0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: ('Search Doctors'),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                textInputAction: TextInputAction.next,
                // onFieldSubmitted: (_){},
                // onSaved: (val){},
                // validator: (value){
                //   if(value.isEmpty){
                //     return 'Provide doctor name/type';
                //   }
                //   return null;
                // },
              ),
            ),
            Container(height: 100,),
            Text('SEARCH DOCTORS', style: Theme.of(context).textTheme.headline1,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Text(
                'Search by directly typing the doctors name, speciality, symptoms, clinics, hospital, etc. You can also search by health concerns listed below',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height / 2.5,
              // child: GestureDetector(
              //   onTap: ()=>MedicalRecordsScreen(),
                    // ()=>Navigator.of(context).pushNamed(MedicalRecordsScreen().routeName,),
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height / 6),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                  ),
                  itemBuilder: (ctx, i){
                    return ChangeNotifierProvider.value(
                      value: doctorCategories[i],
                      child: FindDoctorItem(),
                    );
                  },
                  itemCount: doctorCategories.length,
                ),
              // ),
            )
          ]
        ),
      ),
      bottomNavigationBar: Container(height: 80, child: BottomBar()),
    );
  }
}
