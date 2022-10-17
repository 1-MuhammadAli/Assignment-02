import 'package:assignment_no_2/loginscreens/signup_screen.dart';
import 'package:assignment_no_2/news_screen/adminscreen/admin_screen.dart';
import 'package:assignment_no_2/loginscreens/components/passwordtextfield_widget.dart';
import 'package:assignment_no_2/loginscreens/components/textformfield_widget.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/loginscreens/components/underlinetext_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../user_apiservice.dart';
import 'forgotpassword_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final formkey=GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    UserApiServices userApiServices=UserApiServices();
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
            SizedBox(height: screenSize.height*0.07
            //58,
            ),
            Container(
              height: screenSize.height*0.14,
              width: screenSize.width*0.3,
              // height: 116,
              // width: 116,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Frame.png'),fit: BoxFit.fill
                )
              ),
            ),
            SizedBox(height:
            screenSize.height*0.06,
              //51,
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    controller: emailController,
                    validator: ValidationBuilder().email().maxLength(50).build(),
                    label: 'Email', icon: Icons.email,textInputType: TextInputType.emailAddress,),
                  SizedBox(height: screenSize.height*0.012,),
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
                    padding:  EdgeInsets.only(
                        left: screenSize.width*0.45,
                        //180.0,
                        top: screenSize.height*0.018
                        //16
                    ),
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
                    width: screenSize.width*0.83,
                    //327,
                    height: 48,
                    text: 'Sign In',
                    onPress: () {
                      userApiServices.postUserData(emailController.text.toString(),
                        passController.text.toString(),
                      );

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
                        SizedBox(width: screenSize.width*0.04,),
                        Image.asset('images/facebook.png'),
                        SizedBox(width: screenSize.width*0.04,),
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


