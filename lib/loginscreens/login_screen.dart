import 'dart:convert';

import 'package:assignment_no_2/news_screen/news_screen.dart';
import 'package:assignment_no_2/loginscreens/components/passwordtextfield_widget.dart';
import 'package:assignment_no_2/loginscreens/components/textformfield_widget.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/loginscreens/components/underlinetext_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../../news_screen/adminscreen/addnews_screen.dart';
import 'signup_screen.dart';
import 'forgotpassword_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final formkey=GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
   void login(String email,password) async{
     try{
       Response response= await post(
           Uri.parse('http://54.197.94.1/api/v1/sessions?email=ali@mailinator.com&password=12345678'),
           body: {
             'email':email,
             'password':password,
           }
       );
       if(response.statusCode==200||response.statusCode==201){
         var data=jsonDecode(response.body.toString());
         debugPrint(data['api_token']);
         debugPrint('Account created successfully');
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: TextWidget(
          text: 'Sign In',
          fontWeight: FontWeight.w400,
          textSize: 16, color: Color(0xffFFFFFF),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 51,),
            Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    controller: emailController,
                    validator: ValidationBuilder().email().maxLength(50).build(),
                    label: 'Email', icon: Icons.email,textInputType: TextInputType.emailAddress,),
                  SizedBox(height: 24,),
                  PasswordTextFieldWidget(controller: passController,text: 'Password',textInputAction: TextInputAction.done,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 180.0,top: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),);
                      },
                      child: Text('Forgot Password ?',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF)
                        )
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32,),
                  ButtonWidget(
                    width: 327,
                    height: 48,
                    text: 'Sign In',
                    onPress: () {
                      login(emailController.text.toString(),
                        passController.text.toString(),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => NewsScreen()),);
                    },
                  ),
                  SizedBox(height: 48,),
                  Center(
                    child: TextWidget(text: 'Or by social accounts',
                        fontWeight: FontWeight.w400,
                        textSize: 14, color: Color(0xffFFFFFF)),
                  ),
                  SizedBox(height: 20,),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/ios.png'),
                        SizedBox(width: 15,),
                        Image.asset('images/facebook.png'),
                        SizedBox(width: 15,),
                        Image.asset('images/twitter.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: 80,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(text: 'Don’t have an account ?  ',
                          fontWeight: FontWeight.w400,
                          textSize: 14,
                          color: Color(0xffFFFFFF)),
                      UnderLineTextWidget(
                        text: 'Sign Up',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()),);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


