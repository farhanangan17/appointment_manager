import 'dart:convert';
import 'dart:async';
// import 'dart:html';

import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';


class Auth with ChangeNotifier{
  String _token;
  String _userId;
  DateTime _expiryDate;
  Timer _authTimer;


  String get token{
    if(_expiryDate != null && _expiryDate.isAfter(DateTime.now())&& _token != null){
      return _token;
    }
    return null;
  }

  bool get isAuth{
    return token != null;
  }

  String get userId{
    return _userId;
  }

  Future<void> signup(String name, String email, String contact, String password) async{
    final url = Uri.parse('http://192.168.1.***:3333/api/patient/register');
    try{
      final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(
              {
                'name': name,
                'email': email,
                'contact': contact,
                'password': password,
                'platform': 'mobile',
              }
          )
      );
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
      _userId = responseData['appData']['unique_id'];
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = jsonEncode({
        'userId': _userId,
      });
      prefs.setString('userData', userData);
      print(_userId);
    }catch(error){
      throw error;
    }
  }

  Future<void> login (String email, String password) async {
    final url = Uri.parse('http://192.168.1.***:3333/api/patient/login');
    // print(postData);
    try{
      final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(
              {
                "email": email, "password": password
              }
          )
      );
      final responseData = json.decode(response.body);
      // print(responseData);
      if(responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['token'];
      _userId = responseData['appData']['unique_id'];
      _expiryDate = Jwt.getExpiryDate(_token);
      // _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = jsonEncode({
        'token': _token,
        'userId': _userId,
        'expiryDate': _expiryDate.toIso8601String(),
      });
      prefs.setString('userData', userData);
    }catch(error){
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async{
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if(expiryDate.isBefore(DateTime.now())){
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async{
    _token = null;
    _userId = null;
    _expiryDate = null;
    if(_authTimer != null){
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  Future<void> _autoLogout() async{
    if(_authTimer != null){
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
