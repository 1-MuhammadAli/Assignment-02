import 'package:assignment_no_2/addnews_screen.dart';
import 'package:assignment_no_2/login_screen.dart';
import 'package:assignment_no_2/passwordtextfield_widget.dart';
import 'package:assignment_no_2/signup_screen.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/widgets/underlinetext_widget.dart';
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
        title: TextWidget(text: 'Reset Password',
            fontWeight: FontWeight.w400,
            textSize: 16,
            color: Color(0xffFFFFFF)),
      ),
      body: Column(
        children: [
          SizedBox(height: 58,),
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
            padding: const EdgeInsets.only(top: 66.0),
            child: SizedBox(
              width: 275,
              height: 48,
              child: TextWidget(text: 'Check your email or phone number to retrieve your password.',
                  fontWeight: FontWeight.w400,
                  textSize: 16,
                  color: Color(0xffFFFFFF)),
            ),
          ),
          SizedBox(height: 35,),
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
                SizedBox(height: 24,),
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
                SizedBox(height: 35,),

                ButtonWidget(text: 'Reset Password',
                    height: 48,
                    width: 327,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),);
                    },),
                SizedBox(height: 140,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(text: 'Don’t have an account ?  ',
                        fontWeight: FontWeight.w400,
                        textSize: 14,
                        color: Color(0xffFFFFFF)),
                    UnderLineTextWidget(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),);
                    }, text: 'Sign Up')
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
