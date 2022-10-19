import 'dart:core';
import 'package:assignment_no_2/addnews_apiservices.dart';
import 'package:assignment_no_2/constant.dart';
import 'package:assignment_no_2/getallnews_apiservices.dart';
import 'package:flutter/services.dart';
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
  AddNewsApiServices addNewsApiServices=AddNewsApiServices();

  AddNewsScreen({Key? key}) : super(key: key);
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
            height: 600.0,
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
    var screenSize=MediaQuery.of(context).size;
    GetAllNewsApiServices getAllNewsApiServices=GetAllNewsApiServices();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Color(0xff111820),
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            //statusBarColor: Color(0xff171D27),
            statusBarColor: Colors.transparent
          ),
          elevation: 0,
          title: Center(child: Text('Add News')),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff171D27),Color(0xff1F2430), Color(0xff11181F)],
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
                    width: screenSize.width*0.83,
                    // width: 327,
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
                    width: screenSize.width*0.83,
                    // width: 327,
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
                    width: screenSize.width*0.83,
                    //width: 327,
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
                        showCursor: false,
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
                    width: screenSize.width*0.83,
                    //327,
                    height: screenSize.height*0.058,
                    // height: 48,
                    // width: 327,
                    onPress: () {
                      if(titleController.text.isEmpty)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: TextWidget(
                              text: 'Title is Empty!',
                              fontWeight: FontWeight.w400,
                              textSize: 14,
                              color: Colors.red,
                          ),
                            backgroundColor: Colors.white,
                          ),
                          );
                        }else if(desController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: TextWidget(
                            text: 'Description is Empty!',
                            fontWeight: FontWeight.w400,
                            textSize: 14,
                            color: Colors.red,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        );
                      }else if(matchid==null){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: TextWidget(
                            text: 'Match is Empty!',
                            fontWeight: FontWeight.w400,
                            textSize: 14,
                            color: Colors.red,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        );
                      }else{
                        addNewsApiServices.addnews(
                            desController.text.toString(),
                            titleController.text.toString(),
                            id.toString(),
                            leagueId.toString(),
                            matchid.toString(),
                            token1.toString()
                        );
                      }

                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

