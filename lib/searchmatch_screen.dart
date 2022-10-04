import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
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

class SearchMatchCardWidget extends StatelessWidget {
  final String matchText;
  final String teamText;
  final String image;
  const SearchMatchCardWidget({
    Key? key,required this.image,required this.matchText,required this.teamText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    backgroundImage: AssetImage(image),
                  ),

                  IconButton(),

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
    );
  }
}

class IconButton extends StatefulWidget {
   IconButton({
    Key? key,
  }) : super(key: key);
  
  @override
  State<IconButton> createState() => _IconButtonState();
}
 bool _isChecked=false;
class _IconButtonState extends State<IconButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          _isChecked=!_isChecked;
        });
      },
      child: Container(
          child: _isChecked?Icon(Icons.check_circle_outline,color: Colors.cyan,):Icon(Icons.circle_outlined,color: Colors.cyan,),
      ),
    );
  }
}
