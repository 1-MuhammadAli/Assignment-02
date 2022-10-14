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
    Provider.of<GetAllNewsApiServices>(context).getAllNewsData();
    return SafeArea(
      child: Scaffold(
        body: Container(
              height: 598.6,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/BGImage.png'),
                  fit: BoxFit.fill,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Consumer<GetAllNewsApiServices>(
                    builder: (context, snapshot,_) {
                      if(snapshot.isloaded){
                        return ListView.builder(
                          itemCount: snapshot.allNewsDataList.length,
                          //itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0,left: 15,right: 16),
                              child: NewsCardWidget(
                                name: snapshot.allNewsDataList[index].user.firstName.toString(),
                                description: snapshot.allNewsDataList[index].description,
                                image: snapshot.allNewsDataList[index].user.profileImg.toString(),
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

