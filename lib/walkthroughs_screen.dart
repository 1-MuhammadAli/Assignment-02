import 'package:flutter/material.dart';

class WalkthroughScreen extends StatefulWidget {
   const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int activeIndex = 0;

  List listStock = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
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
          Container(
            alignment: Alignment.bottomCenter,
            height: 150,
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
        ],
      ),
    );
  }
}
