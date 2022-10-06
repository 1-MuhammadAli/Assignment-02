
import 'dart:convert';

import 'package:assignment_no_2/loginscreens/login_screen.dart';
import 'package:assignment_no_2/loginscreens/components/passwordtextfield_widget.dart';
import 'package:assignment_no_2/loginscreens/components/textformfield_widget.dart';
import 'package:assignment_no_2/widgets/button_widget.dart';
import 'package:assignment_no_2/widgets/text_widget.dart';
import 'package:assignment_no_2/loginscreens/components/underlinetext_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formkey=GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  void signup(String name,email,password,confirmPassword) async{
    try{
      Response response= await post(
        Uri.parse('http://54.197.94.1/api/v1/users/?user[email]=ali@mailinator.com&user[first_name]=ali&user[password]=12345678&user[password_confirmation]=12345678'),
        body: {
          'email':email,
          'first_name':name,
          'password':password,
          'password_confirmation':confirmPassword,
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
          text: 'Sign Up',
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
                  PasswordTextFieldWidget(controller: passController,text: 'Password',textInputAction: TextInputAction.next,
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
                  PasswordTextFieldWidget(controller: confirmPassController,text: 'ConfirmPassword',textInputAction: TextInputAction.done,
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
                      signup(nameController.text.toString(),emailController.text.toString(),
                        passController.text.toString(),confirmPassController.text.toString(),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginScreen()),);
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
      ),
    );
  }
}
