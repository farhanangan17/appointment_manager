import 'package:flutter/material.dart';

class DoctorCategory with ChangeNotifier{
  final String categoryId;
  final String categoryTitle;

  DoctorCategory({
    @required this.categoryId,
    @required this.categoryTitle,
  });
}