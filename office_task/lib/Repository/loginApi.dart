import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Screen/a.dart';
import '../model/landingModel.dart';

Future<bool> login(String email, String password) async {
  try {
    final response = await http.post(
        Uri.parse("http://demo1.kitwosd.com/api/login"),
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      final 
      data = jsonDecode(response.body);
      String token = data['data']['token'];
      setToken(token);
      print('login Sucess');
      return true;
    } else {
      print("login failled");
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setString('token', value);
}

Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('token');
  return accessToken;
}

Future<HomeResponse> getdata() async {
  try {
    var token = await getToken();
    final 
    response = await http.get(
        Uri.parse('http://demo1.kitwosd.com/api/menu-items'),
        headers: {"Authorization": "Bearer $token"});
    print(response.statusCode);
    print(token);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());

      print(data);
      final homeResponse = HomeResponse.fromJson(data);

      return homeResponse;
    }

    return Future.error("Invalid Re");
  } catch (error) {
    print(error);
    return Future.error(error.toString());
  }
}
