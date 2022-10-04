
import 'package:flutter/material.dart';
class TextFieldWidget extends StatelessWidget {
  final double height;
  final double width;
  TextFieldWidget({
    Key? key,required this.width,required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xff1B1F2A),
      ),
      child: TextField(
        cursorColor: Color(0xffFFFFFF),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        style: TextStyle(color: Color(0xffFFFFFF),
        ),
      ),
    );
  }
}