import 'package:assignment_no_2/getallnews_apiservices.dart';
import 'package:assignment_no_2/models/getallnews_model.dart';
import 'package:assignment_no_2/news_screen/adminscreen/components/floatingactionbutton_widget.dart';
import 'package:assignment_no_2/news_screen/adminscreen/components/newscard_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'addnews_screen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetAllNewsApiServices getAllNewsApiServices=GetAllNewsApiServices();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getAllNewsApiServices.getAllNewsData(),
          builder: (context,AsyncSnapshot<List<GetAllNewsModel>> snapshot) {
            return Container(
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
                child: ListView.builder(
                  itemCount: getAllNewsApiServices.allNewsDataList.length,
                  //itemCount: 3,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0,left: 15,right: 16),
                    child: NewsCardWidget(
                      name: getAllNewsApiServices.allNewsDataList[index].user.firstName.toString(),
                      description: getAllNewsApiServices.allNewsDataList[index].description,
                       // image: getAllNewsApiServices.allNewsDataList[index].user.profileImg,
                    image: getAllNewsApiServices.allNewsDataList[index].user.profileImg.toString(),
                      //'https://www.vecteezy.com/vector-art/9838950-abstract-cricket-world-cup-and-premier-league-logo-or-poster-design'
                    ),
                  );
                },),
              )
            );
          }
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


// NewsCardWidget(
// name: 'James FC',
// description: 'FIFA’s iconic competitions inspire billions of football fans and provide opportunities to have a wider positive social and environmental impact.By the global nature of the tournaments it ...',
// image: 'images/Frame.png',
// time: '1 mint ago',
// ),
// Column(
// children: [
// SizedBox(height: 10,),
//
// SizedBox(height: 10,),
// NewsCardWidget(
// name: 'James FC',
// description: 'FIFA’s iconic competitions inspire billions of football fans and provide opportunities to have a wider positive social and environmental impact.By the global nature of the tournaments it ...',
// image: 'images/Frame.png',
// time: '1 mint ago',
// ),
// SizedBox(height: 10,),
// NewsCardWidget(
// name: 'James FC',
// description: 'FIFA’s iconic competitions inspire billions of football fans and provide opportunities to have a wider positive social and environmental impact.By the global nature of the tournaments it ...',
// image: 'images/Frame.png',
// time: '1 mint ago',
// ),
//
// ],
// )
