import 'package:assignment_no_2/approvals_screen.dart';
import 'package:assignment_no_2/feed_screen.dart';
import 'package:assignment_no_2/forgotpassword_screen.dart';
import 'package:assignment_no_2/myfeed_screen.dart';
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
    const FeedScreen(),
    const MyFeedScreen(),
    const ApprovalsScreen(),
  ];
  var current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.menu,color: Colors.white,),
        title: SizedBox(
          height: 32,
          width: 32,
          child: Image.asset('images/Frame.png'),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_none_outlined,color: Colors.white,)
        ],
      ),
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                //width: double.infinity,
                height: 42.5,
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
              Container(
                height: 598.6,
                width: double.infinity,
                child: screens[current],
              ),
            ],
          ),
        ),
      );
  }
}
