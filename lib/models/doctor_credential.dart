import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorCredential with ChangeNotifier{
  final String id;
  final String doctorName;
  final String doctorTitle;
  final int categoryId;
  final String education;
  final String membership;
  final String specialization;
  final String services;
  final String organization;
  final String orgAddress;
  final String visitAmount;
  final String yearsOfExp;
  final int likes;
  final String imageUrl;
  final String schedule;

  DoctorCredential({
    @ required this.id,
    @ required this.doctorName,
    @required this.doctorTitle,
    @ required this.categoryId,
    @ required this.education,
    @ required this.membership,
    @ required this.specialization,
    @ required this.services,
    @ required this.organization,
    @required this.orgAddress,
    @ required this.visitAmount,
    @ required this.yearsOfExp,
    @ required this.likes,
    @ required this.imageUrl,
    @ required this.schedule,
  });

  notifyListeners();
}