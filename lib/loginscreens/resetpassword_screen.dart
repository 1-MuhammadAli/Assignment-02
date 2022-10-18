
import 'dart:convert';

import 'package:assignment_no_2/loginscreens/login_screen.dart';
import 'package:assignment_no_2/loginscreens/components/passwordtextfield_widget.dart';
import 'package:assignment_no_2/loginscreens/signup_screen.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/loginscreens/components/underlinetext_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({Key? key}) : super(key: key);
  final formkey=GlobalKey<FormState>();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
   void resetpassword(String password,confirmPassword) async{
     try{
       Response response= await put(Uri.parse('http://54.197.94.1/api/v1/users/36'),
           body: {
             'password':password,
             'password_confirmation':confirmPassword,

           }
       );
       if(response.statusCode==200||response.statusCode==201){
         var data=jsonDecode(response.body.toString());
         debugPrint(data['email']);
       }
       else{
         debugPrint('fail');
       }

     }
     catch(e){
       debugPrint(e.toString());
     }

   }

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: TextWidget(text: 'Reset Password',
              fontWeight: FontWeight.w400,
              textSize: 16,
              color: Color(0xffFFFFFF)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height*0.07,),
              Container(
                height: screenSize.height*0.14,
                width: screenSize.width*0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Frame.png'),fit: BoxFit.fill
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 66.0),
                child: SizedBox(
                  width: screenSize.width*0.8,
                  height: screenSize.height*0.058,
                  child: TextWidget(text: 'Check your email or phone number to retrieve your password.',
                      fontWeight: FontWeight.w400,
                      textSize: 16,
                      color: Color(0xffFFFFFF)),
                ),
              ),
              SizedBox(height: screenSize.height*0.045,),
              Form(
                key: formkey,
                child: Column(
                  children: [

                    PasswordTextFieldWidget(controller: passController,text: 'Password', textInputAction: TextInputAction.next,
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
                    SizedBox(height: screenSize.height*0.03,),
                    PasswordTextFieldWidget(controller: confirmPassController,text: 'ConfirmPassword', textInputAction: TextInputAction.done,
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
                    SizedBox(height: screenSize.height*0.045,),

                    ButtonWidget(text: 'Reset Password',
                      width: screenSize.width*0.83,
                      //327,
                      height: screenSize.height*0.058,
                      //48,
                        onPress: () {
                      resetpassword(passController.text.toString(),confirmPassController.text.toString());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => LoginScreen()),);
                        },),
                    SizedBox(height: screenSize.height*0.16,),



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
        ),
      ),
    );
  }
}
