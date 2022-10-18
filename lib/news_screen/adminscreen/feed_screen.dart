import 'package:assignment_no_2/getallnews_apiservices.dart';
import 'package:assignment_no_2/models/getallnews_model.dart';
import 'package:assignment_no_2/news_screen/adminscreen/components/floatingactionbutton_widget.dart';
import 'package:assignment_no_2/news_screen/adminscreen/components/newscard_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'addnews_screen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    Provider.of<GetAllNewsApiServices>(context).getAllNewsData();
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenSize.height*0.74,
              // height: 598.6,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/BGImage.png'),
                  fit: BoxFit.fill,
                )
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: screenSize.height*0.024
                //20.0
                ),
                child: Consumer<GetAllNewsApiServices>(
                    builder: (context, provider,_) {
                      if(provider.isloaded){
                        return ListView.builder(
                          itemCount: provider.allNewsDataList.length,
                          itemBuilder: (context, index) {
                           // final r = provider.allNewsDataList[index];
                           // print(provider.allNewsDataList.length);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0,left: 15,right: 16),
                              child: NewsCardWidget(
                                name: provider.allNewsDataList[index].user.firstName.toString(),
                                description: provider.allNewsDataList[index].description,
                                image: provider.allNewsDataList[index].user.profileImg.toString(),
                                time: provider.allNewsDataList[index].createdAt.toString(),
                              ),
                            );
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    ),
              )
            ),
        floatingActionButton:   FloatingActionButtonWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNewsScreen()),);
          },
        ),
      ),
    );
  }
}

