import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/doctor_credentials.dart';
import '../widgets/medical_record_item.dart';
import '../widgets/bottom_bar.dart';

class MedicalRecordsScreen extends StatefulWidget {
  static const routeName = '/medical_records_screen';

  @override
  _MedicalRecordsScreenState createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    if(_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DoctorCredentials>(context).fetchCategories().then((_){
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, int>;
    final categoryId = routeArgs['id'];
    final displayedDoctors = Provider.of<DoctorCredentials>(context).findByCatId(categoryId);
    // final allDoctors = Provider.of<DoctorCredentials>(context).items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Medical Records', style: Theme.of(context).textTheme.headline2,),
      ),
      body: ListView.builder(
        // itemCount: displayedDoctors.,
        itemBuilder: (ctx, index){
          return ChangeNotifierProvider.value(
            value: displayedDoctors[index],
            child: MedicalRecordItem(),
          );
        },
        itemCount: displayedDoctors.length,
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
