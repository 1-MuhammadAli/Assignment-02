import 'package:assignment_no_2/forgotpassword_apiservice.dart';
import 'package:assignment_no_2/loginscreens/components/textformfield_widget.dart';
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
    ForgotPasswordApiService forgotPasswordApiService=ForgotPasswordApiService();
    return  Scaffold(
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
            Padding(
              padding: const EdgeInsets.only(top: 15.0,bottom: 35),
              child: SizedBox(
                width: 275,
                height: 48,
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
                  SizedBox(height: 35,),


                  ButtonWidget(text: 'Reset Password',
                      height: 48,
                      width: 327,
                      onPress: () {
                    forgotPasswordApiService.forGotPasswordData(
                      emailController.text.toString(),
                    );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ResetPasswordScreen()),);
                      },),
                  SizedBox(height: 210,),



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
    );
  }
}
