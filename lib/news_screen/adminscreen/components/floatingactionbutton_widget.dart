
import 'package:flutter/material.dart';
class FloatingActionButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const FloatingActionButtonWidget({
    Key? key,required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Container(
          height: 60,
          width: 60,

          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffFFA06D),Color(0xffFA5B62)])
          ),
          child: Icon(Icons.add)),
    );
  }
}