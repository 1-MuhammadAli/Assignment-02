import 'package:assignment_no_2/forgotpassword_apiservice.dart';
import 'package:assignment_no_2/loginscreens/components/textformfield_widget.dart';
import 'package:assignment_no_2/loginscreens/resetpassword_screen.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/loginscreens/components/underlinetext_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_screen.dart';
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formkey=GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    ForgotPasswordApiService forgotPasswordApiService=ForgotPasswordApiService();
    return  GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Forgot Password',
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
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
              SizedBox(height: screenSize.height*0.06,),
              Padding(
                padding:  EdgeInsets.only(top: screenSize.height*0.015,bottom: screenSize.height*0.045),
                child: SizedBox(
                  width: screenSize.width*0.8,
                  height: screenSize.height*0.058,
                  child: TextWidget(text: 'Enter your email or phone number to retrieve your password.',
                      fontWeight: FontWeight.w400,
                      textSize: 16,
                      color: Color(0xffFFFFFF)),
                ),
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: emailController,
                      validator: ValidationBuilder().email().maxLength(50).build(),
                      label: 'Email or Phone Number', icon: Icons.email,textInputType: TextInputType.emailAddress,),
                    SizedBox(height: screenSize.height*0.04,),


                    ButtonWidget(text: 'Reset Password',
                      width: screenSize.width*0.83,
                      //327,
                      height: screenSize.height*0.058,
                      //48,
                        onPress: () {

                      if(formkey.currentState!.validate()){
                        forgotPasswordApiService.forGotPasswordData(
                          emailController.text.toString(),

                        );
                      }
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ResetPasswordScreen()),);
                        },),
                    SizedBox(height: screenSize.height*0.24,),



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
