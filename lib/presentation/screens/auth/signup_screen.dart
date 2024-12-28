import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/models/new_user_model.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/appbars/custom_appbar.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:itax/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: GradientAppBar(
        leadingWidget: Padding(
          padding: EdgeInsets.only(left: 2.w, top: 2.h),
          child:  Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 24.sp)),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Welcome to us',
                  style: TextStyle(
                      color: mainBlueColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Hello there, Create New Account',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 30.h),
                CustomTextInput(
                  controller: fullNameController,
                  hintText: 'First Name',
                  ifPasswordField: false,
                  validator: (value) =>
                      value!.isEmpty ? 'First Name is required' : null,
                ),
                SizedBox(height: 20.h),

                CustomTextInput(
                  controller: fullNameController,
                  hintText: 'Last Name',
                  ifPasswordField: false,
                  validator: (value) =>
                      value!.isEmpty ? 'Last Name is required' : null,
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: emailController,
                  hintText: 'Email',
                  ifPasswordField: false,
                  validator: (value) =>
                      value!.contains('@') ? null : 'Enter a valid email',
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                  ifPasswordField: false,
                  validator: (value) =>
                      value!.length == 10 ? null : 'Enter a valid phone number',
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: passwordController,
                  hintText: 'Password',
                  ifPasswordField: true,
                  validator: (value) => value!.length >= 6
                      ? null
                      : 'Password must be at least 6 characters',
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  ifPasswordField: true,
                  validator: (value) => value == passwordController.text
                      ? null
                      : 'Passwords do not match',
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text('I agree to the terms and conditions'),
                  ],
                ),
                BlueButton(
                  title: 'Sign up',
                  onPressed: () {
                    if (_formKey.currentState!.validate() && isChecked) {
                      authProvider.signUp(NewUserModel(
                        firstName: fullNameController.text.split(' ')[0] ,
                        lastName: fullNameController.text.split(' ')[1] ,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneNumberController.text,
                      ));
                    } else if (!isChecked) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('Please agree to the terms and conditions'),
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
