import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorCredential with ChangeNotifier{
  final String id;
  final String doctorName;
  final String doctorTitle;
  final int categoryId;
  final int sameCategory;
  final List<String> education;
  final List<String> specialization;
  final List<String> services;
  final String address;
  final int visitAmount;
  final int yearsOfExp;
  final int likes;
  final String imageUrl;

  DoctorCredential({
    @ required this.id,
    @ required this.doctorName,
    @required this.doctorTitle,
    @ required this.categoryId,
    this.sameCategory,
    @ required this.education,
    @ required this.specialization,
    @ required this.services,
    @required this.address,
    @ required this.visitAmount,
    @ required this.yearsOfExp,
    @ required this.likes,
    @ required this.imageUrl,
  });

  notifyListeners();
}