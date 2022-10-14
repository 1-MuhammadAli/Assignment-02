import 'package:assignment_no_2/walkthroughscreen/components/walkthrough_widget.dart';
import 'package:flutter/material.dart';
class WalkthroughPage1 extends StatelessWidget {
  const WalkthroughPage1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: WalkthroughWidget(
        image: 'images/Onboarding1.png',
        heading: 'Lorem ipsum dolor ',
        text: 'Donec finibus et lorem in tempus. Etiam id, vel scelerisque dolor.',
      ),
    );
  }
}


