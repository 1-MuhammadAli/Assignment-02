import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text_widget.dart';
import 'drawercard_wigdet.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff1E2434),
      child: Column(
        children: [
          SizedBox(height: 77,),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(46.0),
            dashPattern: [8, 6],
            strokeWidth: 2.5,
            color: Colors.deepOrangeAccent,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(46)),
              child: Container(
                height: 92,
                width: 92,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(46.0),
                    image: DecorationImage(
                      image: AssetImage('images/Ellipse1.png'),
                      fit: BoxFit.fill,
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          TextWidget(text: 'Johne Aly',
            fontWeight: FontWeight.w700,
            textSize: 18,
            color: Color(0xffFFFFFF),),
          SizedBox(height: 6,),
          TextWidget(text: '@Johne39',
            fontWeight: FontWeight.w400,
            textSize: 16,
            color: Color(0xffFFFFFF),),
          SizedBox(height: 46,),
          DrawerCardWidget(
            image: 'images/icon_profile.png',
            text: 'Profile',
            color: Color(0xffFFFFFF),
          ),
          DrawerCardWidget(
            image: 'images/Group380.png',
            text: 'My Predictions',
            color: Color(0xffFFFFFF),
          ),
          DrawerCardWidget(
            image: 'images/FAQs.png',
            text: 'FAQs',
            color: Color(0xffFFFFFF),
          ),
          DrawerCardWidget(
            image: 'images/PrivacyPolicy.png',
            text: 'Privacy Policy',
            color: Color(0xffFFFFFF),
          ),
          DrawerCardWidget(
            image: 'images/TermsofServices.png',
            text: 'Terms of Services',
            color: Color(0xffFFFFFF),
          ),
          DrawerCardWidget(
            image: 'images/admin1.png',
            text: 'Admin',
            color: Color(0xffFFFFFF),
          ),
          SizedBox(height: 67,),
          DrawerCardWidget(
            image: 'images/logout1.png',
            text: 'Logout',
            color: Colors.deepOrangeAccent,
          ),

        ],
      ),
    );
  }
}