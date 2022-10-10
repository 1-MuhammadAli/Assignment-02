import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user_model.dart';
import 'package:http/http.dart' as http;
class UserApiServices{
   String url='http://54.197.94.1/api/v1/sessions';
  Future<UserModel?> postUserData(String email,password) async {
    var response = await http.post(Uri.parse(url),body: {
      'email':email,
      'password':password,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data=jsonDecode(response.body.toString());
      UserModel userData=UserModel.fromJson(data);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('id', userData.id.toString());
      pref.setString('api_token', userData.apiToken.toString());
      var id = pref.getString('id');
      var token=pref.getString('api_token');
      debugPrint(id);
      debugPrint(token);
      return userData;
    } else {
      throw Exception('error');
    }
  }
}