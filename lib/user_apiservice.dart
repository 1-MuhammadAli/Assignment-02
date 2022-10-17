import 'dart:convert';

import 'package:assignment_no_2/constant.dart';
import 'package:assignment_no_2/news_screen/adminscreen/admin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginscreens/login_screen.dart';
import 'models/user_model.dart';
import 'package:http/http.dart' as http;

import 'news_screen/news_screen.dart';

class UserApiServices {
  String url = 'http://54.197.94.1/api/v1/sessions';
  void postUserData(String email, password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(url), body: {
      'email': email,
      'password': password,
    });
    debugPrint(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body.toString());

      UserModel userData = UserModel.fromJson(data);

      pref.setString('id', userData.id.toString());
      pref.setString('api_token', userData.apiToken.toString());
      id = pref.getString('id');
      token = pref.getString('api_token');
      debugPrint(id);
      debugPrint(token);
      navigatorKey.currentState!
          .pushReplacement(MaterialPageRoute(builder: (_) => NewsScreen()));
    } else {
      throw Exception('error');
    }
  }
}
