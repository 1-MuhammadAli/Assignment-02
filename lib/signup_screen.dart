import 'package:assignment_no_2/addnews_screen.dart';
import 'package:assignment_no_2/login_screen.dart';
import 'package:assignment_no_2/passwordtextfield_widget.dart';
import 'package:assignment_no_2/textformfield_widget.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/widgets/underlinetext_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formkey=GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: TextWidget(
          text: 'Sign Up',
          fontWeight: FontWeight.w400,
          textSize: 16, color: Color(0xffFFFFFF),
        ),
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
          SizedBox(height: 51,),
          Form(
            key: formkey,
            child: Column(
              children: [
                TextFormFieldWidget(
                  controller: nameController,
                  validator: (value) {
                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                    {
                      return 'Enter correct name';
                    }
                    else
                    {
                      return null;
                    }
                  },
                  label: 'Full Name', icon: Icons.person,textInputType: TextInputType.name,),
                SizedBox(height: 24,),
                TextFormFieldWidget(
                  controller: emailController,
                  validator: ValidationBuilder().email().maxLength(50).build(),
                  label: 'Email', icon: Icons.email,textInputType: TextInputType.emailAddress,),
                SizedBox(height: 24,),
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
                SizedBox(height: 32,),

                ButtonWidget(
                  width: 327,
                  height: 48,
                  text: 'Sign Up',
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),);
                  },
                ),

                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                        text: 'Do you have an account ?  ',
                        fontWeight: FontWeight.w400,
                        textSize: 14,
                        color: Color(0xffFFFFFF)),
                    UnderLineTextWidget(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),);
                    }, text: 'Sign In')
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
