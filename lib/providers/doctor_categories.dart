import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/doctor_category.dart';

class DoctorCategories with ChangeNotifier {
  List<DoctorCategory> _docCategItems = [
    // DoctorCategory(
    //     id: 'c1',
    //     title: 'General Doctor'
    // ),
    // DoctorCategory(
    //     id: 'c2',
    //     title: 'Skin & Care'
    // ),
    // DoctorCategory(
    //     id: 'c3',
    //     title: 'Child Care'
    // ),
    // DoctorCategory(
    //     id: 'c4',
    //     title: 'Women\'s Health'
    // ),
    // DoctorCategory(
    //     id: 'c5',
    //     title: 'Dentist'
    // ),
    // DoctorCategory(
    //     id: 'c6',
    //     title: 'ENT'
    // ),
    // DoctorCategory(
    //     id: 'c7',
    //     title:'Homeopathy'
    // ),
    // DoctorCategory(
    //     id: 'c8',
    //     title:'Ayurveda'
    // ),
  ];

  // DoctorCategories(this._docCategItems);


  List<DoctorCategory> get items{
    return [..._docCategItems];
    notifyListeners();
  }

  Future<void> fetchCategories() async{
    final url = Uri.parse('http://192.168.1.102:3333/api/doctor/speciality/web/getall');
    final response = await http.get(
      url,
    );
    final getData = json.decode(response.body);
    final extractedData = getData['appData'] as List<dynamic>;
    final List<DoctorCategory> loadedCategories = [];
    extractedData.forEach((element) {
      loadedCategories.add(
        DoctorCategory(
            id: element['id'],
            title: element['title']
        )
      );
    });
        // .forEach((categoryId, categoryData) {
      // loadedCategories.add(
      //   DoctorCategory(
      //     uniqueId: categoryId,
      //     id: categoryData['id'],
      //     title: categoryData['title'],
      //     // imageUrl: categoryData['imageUrl'],
      //     // status: categoryData['status'],
      //     // createdAt: categoryData['createdAt'],
      //     // updatedAt: categoryData['updatedAt'],
      //   )
      // );
    // });
    _docCategItems = loadedCategories;
    notifyListeners();
  }

  notifyListeners();
}