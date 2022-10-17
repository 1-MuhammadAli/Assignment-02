

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'constant.dart';
import 'loginscreens/login_screen.dart';
import 'models/signup_model.dart';

class SignUpApiService {
  void postSignUpData(
      String name,
      email,
      password,
      confirmPassword,
      ) async {
      var response =
      await post(Uri.parse('http://54.197.94.1/api/v1/users'), body: {
        'user[email]': email,
        'user[first_name]': name,
        'user[password]': password,
        'user[password_confirmation]': confirmPassword,
      });
      debugPrint('response${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        SignUpModel signUpData=SignUpModel.fromJson(data);
        // navigatorKey.currentState!
        //     .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
        // debugPrint(data['api_token']);
        // debugPrint('Account created successfully');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
        //return signUpData;
      } else {
        throw Exception('error');
      }
  }
}