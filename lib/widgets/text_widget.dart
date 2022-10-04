import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double textSize;
  final Color color;
  const TextWidget({
    Key? key,required this.text,required this.fontWeight,
    required this.textSize,required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.openSans(
          textStyle:  TextStyle(
              fontWeight: fontWeight,
              fontSize: textSize,
              color: color
          )
      ),
    );
  }
}