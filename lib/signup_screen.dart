import 'package:assignment_no_2/passwordtextfield_widget.dart';
import 'package:assignment_no_2/textformfield_widget.dart';
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
        title: Text('Sign Up',
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
                TextFormFieldWidget(
                  controller: emailController,
                  validator: ValidationBuilder().email().maxLength(50).build(),
                  label: 'Email', icon: Icons.email,textInputType: TextInputType.emailAddress,),
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
                      print(nameController.text);
                      print(emailController.text);
                      print(confirmPassController.text);
                      print(passController.text);
                    }
                  }, child:  Text('Sign Up',
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
                    Text('Do you have an account ?  ',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),
                      ),
                    ),
                    Text(
                        'Sign In',
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
