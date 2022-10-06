import 'package:flutter/material.dart';

import '../../../widgets/text_widget.dart';

class DrawerCardWidget extends StatelessWidget {
  final String image;
  final String text;
  final Color color;
  const DrawerCardWidget({
    Key? key,required this.text,required this.image,required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Row(
          children: [
            Image.asset(image),
            SizedBox(width: 16,),
            TextWidget(text: text,
                fontWeight: FontWeight.w400,
                textSize: 16,
                color: color)
          ],
        ),
      ),
    );
  }
}