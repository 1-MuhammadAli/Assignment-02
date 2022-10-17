
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'constant.dart';
import 'news_screen/news_screen.dart';

class AddNewsApiServices{
  Future addnews(String description, title, id, leagueId, matchId,token1) async {

    try {
      Response response =
      await post(Uri.parse('http://54.197.94.1/api/v1/news'),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "apitoken": token1}, body: jsonEncode({
            'description': description,
            'title': title,
            'user_id': id,
            'league_id': leagueId,
            'match_id': matchId,
          }));

      debugPrint(response.body);
      debugPrint(id);
      debugPrint(matchId);
      debugPrint(token1);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('Ali');
        var data = jsonDecode(response.body);
        navigatorKey.currentState!
            .pushReplacement(MaterialPageRoute(builder: (_) => NewsScreen()));
        debugPrint(data.toString());



      } else {
        debugPrint('fail');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}