
import 'dart:convert';

import 'package:assignment_no_2/models/forgotpassword_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ForgotPasswordApiService{
  Future<ForgotPasswordModel?> forgotpasswordData(String email) async{
      Response response= await put(Uri.parse('http://54.197.94.1/api/v1/users/forgot_password?email=ali@mailinator.com'),
          body: {
            'email':email,
          }
      );
      if(response.statusCode==200||response.statusCode==201){
        var data=jsonDecode(response.body.toString());
        ForgotPasswordModel forgotPassData=ForgotPasswordModel.fromJson(data);
        debugPrint(data['success']);
        return forgotPassData;
      }
      else{
        throw Exception('error');
      }
  }
}