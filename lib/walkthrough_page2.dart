import 'package:assignment_no_2/walkthrough_widget.dart';
import 'package:flutter/material.dart';

class WalkthroughPage2 extends StatelessWidget {
  const WalkthroughPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: WalkthroughWidget(
        image: 'images/Onboarding2.png',
        heading: 'Lorem ipsum dolor ',
        text: 'Donec finibus et lorem in tempus. Etiam id, vel scelerisque dolor.',
      ),
    );
  }
}
