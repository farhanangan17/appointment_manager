import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/doctor_credential.dart';
import '../models/appointment_slot.dart';


class DoctorCredentials with ChangeNotifier{
  List<DoctorCredential> _docCredItems = [
    // DoctorCredential(
    //   id: 'd1',
    //   doctorName: 'Dr. John Doe',
    //   doctorTitle: 'General Physician',
    //   categoryId: 1,
    //   sameCategory: 3,
    //   education: [
    //     'MD-General Medicine|Institute',
    //     'MBBS-Nephrology|More info'
    //   ],
    //   specialization: [
    //     'Consultation Physician',
    //     'Internal Medicine'
    //   ],
    //   services: [
    //     'Peritoneal Dialysis',
    //     'Kidney Stone Treatment'
    //   ],
    //   address: 'HSR layout, Bangalore',
    //   visitAmount: 200,
    //   yearsOfExp: 10,
    //   likes: 120,
    //   imageUrl: 'assets/images/doctor.jpg',
    // ),
  ];

  List<DoctorCredential> get items{
    return [..._docCredItems];
  }

  // List<AppointmentSlot> _appSlotItems = [
  //
  // ];
  //
  // List<AppointmentSlot> get slotItems{
  //   return [..._appSlotItems];
  // }
  //
  // void addAppointmentSlot(DoctorCredential docCred){
  //   final scheduleData = json.decode(docCred.schedule);
  //   // final timingList = scheduleData[1]['timeList'] as List<String>;
  //   for(var i = 0; i < 7; ++i){
  //     final newAppointmentSlot = AppointmentSlot(
  //       weekDayValue: scheduleData[i]['value'],
  //       weekDayName: scheduleData[i]['name'],
  //       timeList: scheduleData[i]['timeList'],
  //     );
  //     _appSlotItems.add(newAppointmentSlot);
  //   }
  //   notifyListeners();
  // }

  Future<void> fetchCategories() async{
    final url = Uri.parse('http://192.168.1.102:3333/api/doctor/web/getall');
    final response = await http.get(
      url,
    );
    final getData = json.decode(response.body);
    final extractedData = getData['appData'] as List<dynamic>;
    final List<DoctorCredential> loadedCategories = [];
    extractedData.forEach((element) {
      loadedCategories.add(
          DoctorCredential(
            id: element['id'].toString(),
            doctorName: element['name'],
            doctorTitle: element['doctorsprofile']['designation'],
            categoryId: element['doctorspeciality']['id'],
            organization: element['doctorsprofile']['organization'],
            orgAddress: element['doctorsprofile']['organization_address'],
            education: element['doctorsprofile']['education'],
            membership: element['doctorsprofile']['membership'],
            yearsOfExp: element['doctorsprofile']['experience_duration'].toString(),
            services: element['doctorsprofile']['experience_details'],
            specialization: element['doctorsprofile']['experience_details'],
            visitAmount: element['doctorsprofile']['online_fee'].toString(),
            likes: 120,
            imageUrl: 'assets/images/doctor.jpg',
            schedule: element['doctorsprofile']['schedule'],
          )
      );
    });
    _docCredItems = loadedCategories;
    notifyListeners();
  }

  List<DoctorCredential> findByCatId(int catId){
    List<DoctorCredential> _sameCatDoc = [];
    _sameCatDoc.addAll(_docCredItems.where((element) => element.categoryId == catId));
    return _sameCatDoc;
  }

  DoctorCredential findById(String id){
    return _docCredItems.firstWhere((prod) => prod.id == id);
  }

  notifyListeners();
}










// DoctorCredential(
//   id: 'd2',
//   doctorName: 'Dr. John Doe',
//   doctorTitle: 'General Physician',
//   categoryId: 1,
//   sameCategory: 3,
//   education: [
//     'MD-General Medicine|Institute',
//     'MBBS-Nephrology|More info'
//   ],
//   specialization: [
//     'Consultation Physician',
//     'Internal Medicine'
//   ],
//   services: [
//     'Peritoneal Dialysis',
//     'Kidney Stone Treatment'
//   ],
//   address: 'HSR layout, Bangalore',
//   visitAmount: 200,
//   yearsOfExp: 10,
//   likes: 120,
//   imageUrl: 'assets/images/doctor.jpg',
// ),
// DoctorCredential(
//   id: 'd3',
//   doctorName: 'Dr. John Doe',
//   doctorTitle: 'General Physician',
//   categoryId: 3,
//   sameCategory: 3,
//   education: [
//     'MD-General Medicine|Institute',
//     'MBBS-Nephrology|More info'
//   ],
//   specialization: [
//     'Consultation Physician',
//     'Internal Medicine'
//   ],
//   services: [
//     'Peritoneal Dialysis',
//     'Kidney Stone Treatment'
//   ],
//   address: 'HSR layout, Bangalore',
//   visitAmount: 200,
//   yearsOfExp: 10,
//   likes: 120,
//   imageUrl: 'assets/images/doctor.jpg',
// ),
// DoctorCredential(
//   id: 'd4',
//   doctorName: 'Dr. John Doe',
//   doctorTitle: 'General Physician',
//   categoryId: 4,
//   sameCategory: 1,
//   education: [
//     'MD-General Medicine|Institute',
//     'MBBS-Nephrology|More info'
//   ],
//   specialization: [
//     'Consultation Physician',
//     'Internal Medicine'
//   ],
//   services: [
//     'Peritoneal Dialysis',
//     'Kidney Stone Treatment'
//   ],
//   address: 'HSR layout, Bangalore',
//   visitAmount: 200,
//   yearsOfExp: 10,
//   likes: 120,
//   imageUrl: 'assets/images/doctor.jpg'
//   // 'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true%27',
// )