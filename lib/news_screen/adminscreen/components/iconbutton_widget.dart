import 'package:flutter/material.dart';
class IconButtonWidget extends StatefulWidget {
  IconButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}
bool _isChecked=false;
class _IconButtonWidgetState extends State<IconButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          _isChecked=!_isChecked;
        });
      },
      child: Container(
        child: _isChecked?Icon(Icons.check_circle_outline,color: Colors.cyan,):Icon(Icons.circle_outlined,color: Colors.cyan,),
      ),
    );
  }
}