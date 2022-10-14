import 'dart:convert';
import 'dart:io';
import 'package:assignment_no_2/constant.dart';
import 'package:flutter/cupertino.dart';
import 'models/getallnews_model.dart';
import 'package:http/http.dart' as http;
class GetAllNewsApiServices extends ChangeNotifier{
  bool _isloaded = false;
  bool get isloaded => _isloaded;
  set isloaded(bool value) {
    _isloaded = value;
  }
  List<GetAllNewsModel> _allNewsDataList = [];
  List<GetAllNewsModel> get allNewsDataList => _allNewsDataList;
  String url = "http://54.197.94.1/api/v1/news?league_id=31";
  get token1 => token;
  Future<List<GetAllNewsModel>> getAllNewsData() async {
    var response = await http.get(Uri.parse(url),headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      "apitoken": token1},);
    var data=jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      for(Map<String,dynamic> i in data){
        allNewsDataList.add(GetAllNewsModel.fromJson(i));
      }
      // debugPrint(allNewsDataList[5].description.toString());
      // debugPrint('AABC');
      isloaded = true;
      notifyListeners();
      return allNewsDataList;
    } else {
      isloaded = true;
      // debugPrint('fail1223');
      notifyListeners();
      return [];
    }
  }
}