import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final Function validator;
  final TextInputAction textInputAction;
  PasswordTextFieldWidget({required this.controller,required this.text,required this.validator,required this.textInputAction});

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool isPasswordVisible=true;
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: screenSize.width*0.83,
        height: screenSize.height*0.058,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: TextFormField(
          controller: widget.controller,
          validator: (value) => widget.validator(value),
          obscureText: isPasswordVisible,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            //label: Text(widget.text),
            hintText: widget.text,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'OpenSans'
            ),
            // labelStyle: GoogleFonts.openSans(
            //   textStyle: TextStyle(
            //     fontSize: 14,
            //     fontWeight: FontWeight.w400,
            //     color: Colors.white
            //   )
            // ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            prefixIcon: const Icon(Icons.lock_outline,color: Colors.white,),
            suffixIcon: IconButton(onPressed: (){
              setState(() {
                isPasswordVisible=!isPasswordVisible;
              });
            },
              icon: isPasswordVisible
                  ? const Icon(Icons.visibility_off, color: Color(0xffA8A8A8),)
                  : const Icon(Icons.visibility, color: Color(0xffA8A8A8),),
            ),
          ),
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
      ),
    );
  }
}