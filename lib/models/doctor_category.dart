import 'package:flutter/material.dart';

class DoctorCategory with ChangeNotifier{
  final int id;
  final String title;
  // final String imageUrl;
  // final int status;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  DoctorCategory({
    @required this.id,
    @required this.title,
    // @required this.imageUrl,
    // @required this.status,
    // @required this.createdAt,
    // @required this.updatedAt,
  });
}