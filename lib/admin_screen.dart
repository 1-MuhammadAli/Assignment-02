import 'package:assignment_no_2/login_screen.dart';
import 'package:assignment_no_2/signup_screen.dart';
import 'package:assignment_no_2/walkthroughs_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<String> items = [
    "FEED",
    "MY FEED",
    "APPROVALS",
  ];
  List<Widget> screens = [
    // VideoMedia(),
    // AudioMedia(),
    // PhotoMedia(),
    WalkthroughScreen(),
    SignUpScreen(),
    LoginScreen(),
  ];

  // bool isClicked = false;

  var current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(left: 1),
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff434446),
                              //borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                items[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: current == index ? Colors.pinkAccent : Colors.grey,),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: current == index,
                            child: Container(
                              width: 130,
                              height: 2.5,
                              decoration: const BoxDecoration(
                                color: Colors.pinkAccent,
                                //shape: BoxShape.circle
                              ),
                            ))
                      ],
                    );
                  }),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 7.0),
                width: double.infinity,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    screens[current],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
