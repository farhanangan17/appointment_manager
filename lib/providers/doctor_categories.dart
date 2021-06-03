import '../models/doctor_category.dart';
import 'package:flutter/material.dart';

class DoctorCategories with ChangeNotifier {
  List<DoctorCategory> _docCategItems = [
    DoctorCategory(
        categoryId: 'c1',
        categoryTitle: 'General Doctor'
    ),
    DoctorCategory(
        categoryId: 'c2',
        categoryTitle: 'Skin & Care'
    ),
    DoctorCategory(
        categoryId: 'c3',
        categoryTitle: 'Child Care'
    ),
    DoctorCategory(
        categoryId: 'c4',
        categoryTitle: 'Women\'s Health'
    ),
    DoctorCategory(
        categoryId: 'c5',
        categoryTitle: 'Dentist'
    ),
    DoctorCategory(
        categoryId: 'c6',
        categoryTitle: 'ENT'
    ),
    DoctorCategory(
        categoryId: 'c7',
        categoryTitle: 'Homeopathy'
    ),
    DoctorCategory(
        categoryId: 'c8',
        categoryTitle: 'Ayurveda'
    ),
  ];


  List<DoctorCategory> get items{
    return [..._docCategItems];
    notifyListeners();
  }

  notifyListeners();
}