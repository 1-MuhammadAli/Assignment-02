import 'package:assignment_no_2/news_screen/adminscreen/components/floatingactionbutton_widget.dart';
import 'package:assignment_no_2/news_screen/adminscreen/components/newscard_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'addnews_screen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              SizedBox(height: 10,),
              NewsCardWidget(
                name: 'James FC',
                description: 'FIFA’s iconic competitions inspire billions of football fans and provide opportunities to have a wider positive social and environmental impact.By the global nature of the tournaments it ...',
                image: 'images/Frame.png',
                time: '1 mint ago',
              ),
              SizedBox(height: 10,),
              NewsCardWidget(
                name: 'James FC',
                description: 'FIFA’s iconic competitions inspire billions of football fans and provide opportunities to have a wider positive social and environmental impact.By the global nature of the tournaments it ...',
                image: 'images/Frame.png',
                time: '1 mint ago',
              ),
              SizedBox(height: 10,),
              NewsCardWidget(
                name: 'James FC',
                description: 'FIFA’s iconic competitions inspire billions of football fans and provide opportunities to have a wider positive social and environmental impact.By the global nature of the tournaments it ...',
                image: 'images/Frame.png',
                time: '1 mint ago',
              ),

            ],
          ),
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




