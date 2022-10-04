import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onPress;
  const ButtonWidget({
    Key? key,required this.text,required this.height,required this.width,required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffF67599),
            Color(0xffE41E7A),
            Color(0xff67249C),
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(text,
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
    );
  }
}