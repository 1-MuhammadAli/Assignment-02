import 'package:flutter/material.dart';
class IconButtonWidget extends StatefulWidget {
  int index;
  IconButtonWidget({
    Key? key,required this.index,
  }) : super(key: key);

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}
int? selectIndex;
class _IconButtonWidgetState extends State<IconButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          selectIndex=widget.index;
        });
      },
      child: Container(
        child: selectIndex==widget.index?Icon(Icons.check_circle_outline,color: Colors.cyan,):Icon(Icons.circle_outlined,color: Colors.cyan,),
      ),
    );
  }
}