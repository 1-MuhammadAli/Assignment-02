import 'dart:async';

import 'package:assignment_no_2/loginscreens/login_screen.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
import 'news_screen/adminscreen/admin_screen.dart';
import 'news_screen/news_screen.dart';
import 'walkthroughscreen/walkthroughs_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) => id == null ? NewsScreen() : onBoarding==true ? WalkthroughScreen():LoginScreen(),
          ));
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Center(
          child: Container(
            child: Image.asset('images/Frame.png'),
          ),
        ),
      ),
    );
  }
}