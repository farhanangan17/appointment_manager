
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/medical_records_screen.dart';
import '../models/doctor_category.dart';
import '../models/doctor_credential.dart';
import '../providers/doctor_categories.dart';
import '../providers/doctor_credentials.dart';
import '../widgets/medical_record_item.dart';

class FindDoctorItem extends StatelessWidget {

  void selectCategory(BuildContext ctx, DoctorCategory docCateg){
    Navigator.of(ctx).pushNamed(MedicalRecordsScreen.routeName,
        arguments:{
          'id': docCateg.id,
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final catTitle = Provider.of<DoctorCategory>(context, listen: false);
    // final doctorCredentials = Provider.of<DoctorCredentials>(context).items;
    return GestureDetector(
      onTap: ()=> selectCategory(context, catTitle),
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).buttonColor,
        ),
        child: Center(
          child: Text(catTitle.title, style: Theme.of(context).textTheme.headline3,),
        ),
      ),
    );
  }
}
