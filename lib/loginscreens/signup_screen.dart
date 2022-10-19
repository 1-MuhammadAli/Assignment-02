import 'package:assignment_no_2/loginscreens/login_screen.dart';
import 'package:assignment_no_2/loginscreens/components/passwordtextfield_widget.dart';
import 'package:assignment_no_2/loginscreens/components/textformfield_widget.dart';
import 'package:assignment_no_2/signup_apiservice.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/loginscreens/components/underlinetext_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    SignUpApiService signUpApiServices=SignUpApiService();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: TextWidget(
            text: 'Sign Up',
            fontWeight: FontWeight.w400,
            textSize: 16,
            color: Color(0xffFFFFFF),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height*0.07),
              Container(
                height: screenSize.height*0.14,
                width: screenSize.width*0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Frame.png'), fit: BoxFit.fill)),
              ),
              SizedBox(
                height:screenSize.height*0.06,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return 'Enter correct name';
                        } else {
                          return null;
                        }
                      },
                      label: 'Full Name',
                      icon: Icons.person,
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: screenSize.height*0.028,
                    ),
                    TextFormFieldWidget(
                      controller: emailController,
                      validator:
                          ValidationBuilder().email().maxLength(50).build(),
                      label: 'Email',
                      icon: Icons.email,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: screenSize.height*0.028,
                    ),
                    PasswordTextFieldWidget(
                      controller: passController,
                      text: 'Password',
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
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
                    SizedBox(
                      height: screenSize.height*0.028,
                    ),
                    PasswordTextFieldWidget(
                      controller: confirmPassController,
                      text: 'Confirm Password',
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        // RegExp regex =
                        // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (passController.text == confirmPassController.text) {
                          return null;
                        } else {
                          return 'Please enter same password';
                        }
                      },
                    ),
                    SizedBox(
                      height: screenSize.height*0.035,
                    ),
                    ButtonWidget(
                      width: screenSize.width*0.83,
                      height: screenSize.height*0.058,
                      text: 'Sign Up',
                      onPress: () {

                        if(formkey.currentState!.validate()){
                          signUpApiServices.postSignUpData(
                            nameController.text.toString(),
                            emailController.text.toString(),
                            passController.text.toString(),
                            confirmPassController.text.toString(),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: screenSize.height*0.12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                            text: 'Do you have an account ?  ',
                            fontWeight: FontWeight.w400,
                            textSize: 14,
                            color: Color(0xffFFFFFF)),
                        UnderLineTextWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            text: 'Sign In')
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
