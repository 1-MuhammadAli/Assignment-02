import 'package:assignment_no_2/walkthrough_page1.dart';
import 'package:assignment_no_2/walkthrough_page2.dart';
import 'package:assignment_no_2/walkthrough_page3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Container(
                width: 218,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Colors.pinkAccent,
                      Colors.deepPurple,
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Get Started',
                      textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    )
                  )
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    // elevation: MaterialStateProperty.all(3),
                    //shadowColor: Colors.transparent,
                  ),
                ),
              )
            ],
          ),
        ],
      ),

    );
  }
}
class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.0,
      width: isActive ? 8.0 : 8.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: isActive ? Colors.green : Colors.white,
      ),
    );
  }
}