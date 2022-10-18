import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextInputType textInputType;
  final Function validator;
  final TextEditingController controller;
   TextFormFieldWidget({
    required this.label,
    required this.icon,
    required this.textInputType,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Center(
      child: Container(
        //padding: const EdgeInsets.only(left: 51.0, right: 51.0),
        width: screenSize.width*0.83,
        height: screenSize.height*0.065,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.withOpacity(0.1)
        ),
        child: TextFormField(

          controller: controller,
          validator: (value) => validator(value),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white,
              fontFamily: 'OpenSans'
            ),
            // Text(label,style: GoogleFonts.openSans(
            //   textStyle: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.w400,
            //     fontSize: 14,
            //   )
            // ),),
            prefixIcon: Icon(icon,color:Colors.white,),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          style: TextStyle(color: Color(0xffFFFFFF),),
          textInputAction: TextInputAction.next,
          keyboardType: textInputType,
        ),
      ),
    );
  }
}
