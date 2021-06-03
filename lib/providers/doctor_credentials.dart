import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/doctor_credential.dart';


class DoctorCredentials with ChangeNotifier{
  final List<DoctorCredential> _docCredItems = [
    DoctorCredential(
      id: 'd1',
      doctorName: 'Dr. John Doe',
      doctorTitle: 'General Physician',
      categoryId: 'c1',
      sameCategory: 3,
      education: [
        'MD-General Medicine|Institute',
        'MBBS-Nephrology|More info'
      ],
      specialization: [
        'Consultation Physician',
        'Internal Medicine'
      ],
      services: [
        'Peritoneal Dialysis',
        'Kidney Stone Treatment'
      ],
      address: 'HSR layout, Bangalore',
      visitAmount: 200,
      yearsOfExp: 10,
      likes: 120,
      imageUrl: 'assets/images/doctor.jpg',
    ),
    DoctorCredential(
      id: 'd2',
      doctorName: 'Dr. John Doe',
      doctorTitle: 'General Physician',
      categoryId: 'c1',
      sameCategory: 3,
      education: [
        'MD-General Medicine|Institute',
        'MBBS-Nephrology|More info'
      ],
      specialization: [
        'Consultation Physician',
        'Internal Medicine'
      ],
      services: [
        'Peritoneal Dialysis',
        'Kidney Stone Treatment'
      ],
      address: 'HSR layout, Bangalore',
      visitAmount: 200,
      yearsOfExp: 10,
      likes: 120,
      imageUrl: 'assets/images/doctor.jpg',
    ),
    DoctorCredential(
      id: 'd3',
      doctorName: 'Dr. John Doe',
      doctorTitle: 'General Physician',
      categoryId: 'c1',
      sameCategory: 3,
      education: [
        'MD-General Medicine|Institute',
        'MBBS-Nephrology|More info'
      ],
      specialization: [
        'Consultation Physician',
        'Internal Medicine'
      ],
      services: [
        'Peritoneal Dialysis',
        'Kidney Stone Treatment'
      ],
      address: 'HSR layout, Bangalore',
      visitAmount: 200,
      yearsOfExp: 10,
      likes: 120,
      imageUrl: 'assets/images/doctor.jpg',
    ),
    DoctorCredential(
      id: 'd4',
      doctorName: 'Dr. John Doe',
        doctorTitle: 'General Physician',
      categoryId: 'c3',
      sameCategory: 1,
      education: [
        'MD-General Medicine|Institute',
        'MBBS-Nephrology|More info'
      ],
      specialization: [
        'Consultation Physician',
        'Internal Medicine'
      ],
      services: [
        'Peritoneal Dialysis',
        'Kidney Stone Treatment'
      ],
      address: 'HSR layout, Bangalore',
      visitAmount: 200,
      yearsOfExp: 10,
      likes: 120,
      imageUrl: 'assets/images/doctor.jpg'
      // 'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true%27',
    )
  ];

  List<DoctorCredential> get items{
    return [..._docCredItems];
  }

  DoctorCredential findByCatId(String catId){
    return _docCredItems.firstWhere((prod) => prod.categoryId == catId);
  }

  DoctorCredential findById(String id){
    return _docCredItems.firstWhere((prod) => prod.id == id);
  }

  notifyListeners();
}
