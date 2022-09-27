import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalkthroughPage1 extends StatelessWidget {
  const WalkthroughPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Container(
            height: screenSize.height*0.65,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Onboarding1.png'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            height: screenSize.height*0.15,
            width: screenSize.width*1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 20,
                  blurRadius: 20,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Text('Lorem ipsum dolor ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: 275,
                      height: 48,
                      child: Text('Donec finibus et lorem in tempus. Etiam id, vel scelerisque dolor.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,

                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
