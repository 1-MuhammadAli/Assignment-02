import 'package:flutter/services.dart';

import 'approvals_screen.dart';
import 'feed_screen.dart';

import 'package:flutter/material.dart';

import 'components/drawer_widget.dart';
import 'myfeed_screen.dart';

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
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff171D27),Color(0xff1F2430), Color(0xff11181F)],
              )),
        ),
        //leading: Icon(Icons.menu,color: Colors.white,),
        title: SizedBox(
          height: screenSize.height*0.040,
          width: screenSize.width*0.08,
          // height: 32,
          // width: 32,
          child: Image.asset('images/Frame.png'),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_none_outlined,color: Colors.white,)
        ],
      ),
        drawer: DrawerWidget(),
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                 height: screenSize.height*0.0559,
                //height: 42.5,
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
                                width: screenSize.width*0.33,

                             //width: 130,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xff1B212E),
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
                                width: screenSize.width*0.33,
                                height: screenSize.height*0.0025,
                                // width: 130,
                                //  height: 2.5,
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
                 height: screenSize.height*0.74,
                 // height:
                 // 598.6,
                width: double.infinity,
                child: screens[current],
              ),
            ],
          ),
        ),
      );
  }
}






