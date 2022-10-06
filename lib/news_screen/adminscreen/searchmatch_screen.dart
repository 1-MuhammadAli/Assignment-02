import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'components/searchmatchcard_widget.dart';
class SearchMatchScreen extends StatelessWidget {
  const SearchMatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 750,
        width: double.infinity,
        decoration: BoxDecoration(
          color:  Color(0xff1E232F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 1,
              width: 39,
              color: Colors.grey,
            ),
            SizedBox(height: 63,),
            SearchMatchCardWidget(
              image: 'images/Frame.png',
              matchText: 'FIFA Matches',
              teamText: 'ENG - GR',
            ),
            SizedBox(height: 10,),
            SearchMatchCardWidget(
              image: 'images/Frame.png',
              matchText: 'FIFA Matches',
              teamText: 'ENG - GR',
            ),
            SizedBox(height: 10,),
            SearchMatchCardWidget(
              image: 'images/Frame.png',
              matchText: 'FIFA Matches',
              teamText: 'ENG - GR',
            ),
            SizedBox(height: 10,),
            SearchMatchCardWidget(
              image: 'images/Frame.png',
              matchText: 'FIFA Matches',
              teamText: 'ENG - GR',
            ),
          ],
        ),
      );
  }
}




