import 'dart:convert';
import 'dart:io';

import 'package:assignment_no_2/constant.dart';
import 'package:flutter/cupertino.dart';

import 'models/getallnews_model.dart';
import 'package:http/http.dart' as http;

class GetAllNewsApiServices{
 // bool isloaded = false;
  List<GetAllNewsModel> _allNewsDataList = [];
  List<GetAllNewsModel> get allNewsDataList => _allNewsDataList;
  String url = "http://54.197.94.1/api/v1/news?league_id=31";
  get token1 => token;
  Future<List<GetAllNewsModel>> getAllNewsData() async {
    var response = await http.get(Uri.parse(url),headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      "apitoken": "$token1"},);
    if (response.statusCode == 200 || response.statusCode == 201) {
      allNewsDataList.add(GetAllNewsModel.fromJson(jsonDecode(response.body)));
      debugPrint('AABC');
      //isloaded = true;
      return allNewsDataList;
    } else {
      //isloaded = true;
      debugPrint('fail');
      return [];
    }
  }
}