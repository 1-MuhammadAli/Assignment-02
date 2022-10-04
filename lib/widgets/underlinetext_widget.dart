import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderLineTextWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const UnderLineTextWidget({
    Key? key,required this.onTap,required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(text,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 5,
                color: Colors.cyan,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          )
      ),
    );
  }
}