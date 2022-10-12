import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:assignment_no_2/constant.dart';
import 'package:assignment_no_2/getallnews_apiservices.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'searchmatch_screen.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/news_screen/adminscreen/components/textfield_widget.dart';
import 'package:flutter/material.dart';

class AddNewsScreen extends StatelessWidget {
  final desController = TextEditingController();
  final titleController = TextEditingController();
  final String userId = id;
  final String token1=token;
  final int leagueId = 31;
  GetAllNewsApiServices getAllNewsApiServices=GetAllNewsApiServices();

  void addnews(String description, title, id, leagueId, matchId,token1) async {

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

        debugPrint(data.toString());



      } else {
        debugPrint('fail');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        context: ctx,
        builder: (builder) {
          return Container(
            height: 700.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff1E232F),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: SearchMatchScreen(),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    GetAllNewsApiServices getAllNewsApiServices=GetAllNewsApiServices();
    return Scaffold(
      backgroundColor: Color(0xff111820),
      appBar: AppBar(
        elevation: 5,
        title: Center(child: Text('Add News')),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1F2431), Color(0xff11181F)],
          )),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: TextWidget(
                  text: 'Title',
                  fontWeight: FontWeight.w400,
                  textSize: 16,
                  color: Color(0xffFFFFFF),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: TextFieldWidget(
                  controller: titleController,
                  height: 48,
                  width: 327,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: TextWidget(
                  text: 'Description',
                  fontWeight: FontWeight.w400,
                  textSize: 16,
                  color: Color(0xffFFFFFF),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: TextFieldWidget(
                  controller: desController,
                  height: 149,
                  width: 327,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: TextWidget(
                  text: 'Match:',
                  fontWeight: FontWeight.w400,
                  textSize: 16,
                  color: Color(0xffFFFFFF),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Container(
                  height: 48,
                  width: 327,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff111820),
                      border: Border.all(width: 1.0, color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      onTap: () => startAddNewTransaction(context),
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xffFFFFFF),
                          )),
                      style: TextStyle(color: Color(0xffFFFFFF)),
                      cursorColor: Color(0xffFFFFFF),
                      keyboardType: TextInputType.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 113,
              ),
              Center(
                child: ButtonWidget(
                  text: 'Submit',
                  height: 48,
                  width: 327,
                  onPress: () {
                    addnews(
                        desController.text.toString(),
                        titleController.text.toString(),
                        id.toString(),
                        leagueId.toString(),
                        matchid.toString(),
                      token1.toString()
                    );
                    getAllNewsApiServices.getAllNewsData();
                   //
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
