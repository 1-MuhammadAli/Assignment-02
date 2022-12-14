
import 'package:flutter/material.dart';

import '../../../widgets/text_widget.dart';
import 'iconbutton_widget.dart';
class SearchMatchCardWidget extends StatelessWidget {
  final int id;
  final String matchText;
  final String teamText;
  final String image;
  int index;
  SearchMatchCardWidget({
    Key? key,required this.id,required this.image,required this.matchText,required this.teamText,required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 15),
      child: Container(
        height: 80,
        width: 344,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xff232836)
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(image),
                    ),

                   IconButtonWidget(
                     index: index,
                   )

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 78),
              child: Column(
                children: [
                  TextWidget(text: matchText,
                    fontWeight: FontWeight.w400,
                    textSize: 16,
                    color: Color(0xffFFFFFF),),
                  SizedBox(height: 5,),
                  TextWidget(text: teamText,
                      fontWeight: FontWeight.w400,
                      textSize: 12,
                      color: Colors.grey)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}