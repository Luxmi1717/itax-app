import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/main.dart';
import 'package:itax/models/new_user_model.dart';
import 'package:itax/models/user_model.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_appbar.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:itax/repositories/auth_repository.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = new TextEditingController();

    final TextEditingController emailController = new TextEditingController(); 

    final TextEditingController phoneNumberController = new TextEditingController(); 

    final TextEditingController passwordController = new TextEditingController(); 

    final TextEditingController confirmPasswordController = new TextEditingController(); 

        final authProvider = Provider.of<AuthProvider>(context, listen: false);

    bool isChecked = false;
    return Scaffold(
      appBar: GradientAppBar(
        leadingWidget: Padding(
          padding:  EdgeInsets.only(left: 2.w, top: 2.h),
          child: const Text(
            'Sign up',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to us',
                      style: TextStyle(
                          color: mainBlueColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hello there, Create New Account',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.px,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/signup-logo.png',
                          width: 60.w,
                          height: 25.h,
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomTextInput(
                      controller: fullNameController,
                      hintText: 'Full Name',
                      ifPasswordField: false,
                      
                    ),
                     SizedBox(height: 4.h),
                    CustomTextInput(controller: emailController, hintText: 'Email', ifPasswordField: false),
                                         SizedBox(height: 4.h),
                     CustomTextInput(controller: phoneNumberController, hintText: 'Phone Number', ifPasswordField: false),
                                         SizedBox(height: 4.h),
                   CustomTextInput(controller: passwordController, hintText: 'Password', ifPasswordField: true),
                                         SizedBox(height: 4.h),
                                       CustomTextInput(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        ifPasswordField: true),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80.w,
                          child: Row(
                            children: [
                                StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                    isChecked = value!;
                                    });
                                  },
                                  );
                                },
                                ),
                              const Text('By creating an account you agree \nto our',overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                    const SizedBox(height: 20),
                    BlueButton(
                      title: 'Sign up',
                      onPressed: () {
                        authProvider.signUp(
                          NewUserModel(
                            firstName: fullNameController.text.split('')[0],
                            email: emailController.text,
                            
                            password: passwordController.text, lastName: fullNameController.text.split(' ')[1], phone: phoneNumberController.text,
                          ),

                        );

                      },
                    ),
                    SizedBox(height: 1.h),
                   
                    
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Have an account?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text(
                          'Login',
                          style: TextStyle(color: mainBlueColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
