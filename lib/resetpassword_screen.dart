import 'package:assignment_no_2/passwordtextfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({Key? key}) : super(key: key);
  final formkey=GlobalKey<FormState>();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Reset Password',
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 116,
            width: 116,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Frame.png'),fit: BoxFit.fill
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SizedBox(
              width: 275,
              height: 48,
              child: Text('Check your email or phone number to retrieve your password.',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,

                )),
              ),
            ),
          ),
          Form(
            key: formkey,
            child: Column(
              children: [

                PasswordTextFieldWidget(controller: passController,text: 'Password',
                  validator: (value) {
                    RegExp regex =
                    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                PasswordTextFieldWidget(controller: confirmPassController,text: 'ConfirmPassword',
                  validator: (value) {
                    // RegExp regex =
                    // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (passController.text==confirmPassController.text) {
                      return null;
                    } else {
                      return 'Please enter same password';

                    }
                  },
                ),

                Container(
                  width: 327,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 2.0],
                      colors: [
                        Colors.pinkAccent,
                        Colors.deepPurple,
                      ],
                    ),
                  ),
                  child: ElevatedButton(onPressed:  () {
                    if(formkey.currentState!.validate()){
                      print(confirmPassController.text);
                      print(passController.text);
                    }
                  }, child:  Text('Reset Password',
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      // elevation: MaterialStateProperty.all(3),
                      //shadowColor: Colors.transparent,
                    ),
                  ),
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account ?  ',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),
                      ),
                    ),
                    Text(
                        'Sign Up',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 5,
                              color: Colors.cyan,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
