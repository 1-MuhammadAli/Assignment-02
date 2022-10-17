import 'package:assignment_no_2/constant.dart';
import 'package:assignment_no_2/walkthroughscreen/pages/walkthrough_page1.dart';
import 'package:assignment_no_2/walkthroughscreen/pages/walkthrough_page2.dart';
import 'package:assignment_no_2/walkthroughscreen/pages/walkthrough_page3.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/walkthroughscreen/components/pageindicator_widget.dart';
import 'package:flutter/material.dart';
import '../loginscreens/login_screen.dart';

class WalkthroughScreen extends StatefulWidget {
   const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int activeIndex = 0;

  List listStock = [
    const WalkthroughPage1(),
    const WalkthroughPage2(),
    const WalkthroughPage3(),

  ];

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Container(
      height: screenSize.height*1,
      color: Colors.black12,
      child: Column(
        children: [
          Container(
            height: screenSize.height*0.8,
            child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    controller: PageController(viewportFraction: 1),
                    itemCount: listStock.length,
                    itemBuilder: (context, index) {
                      return listStock[index];
                    }),
          ),
          Column(
            children: [
              Container(
                height: screenSize.height*0.1,
                child: Padding(
                  padding:  EdgeInsets.only(bottom:
                  screenSize.height*0.02
                  //20.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        listStock.length,
                            (index) => Indicator(
                          isActive: activeIndex == index ? true : false,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                width: screenSize.width*0.6,
                height: screenSize.height*0.06,
                // width: 218,
                // height: 48,
                text: 'Get Started',
                onPress: () {
                  onBoarding=false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),);
                },
              )
            ],
          ),
        ],
      ),

    );
  }
}


