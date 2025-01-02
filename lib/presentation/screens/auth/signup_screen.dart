import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/auth_state.dart';
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

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.mainGradient,
            ),
          ),
          leading: InkWell(
              onTap: () {
                GoRouter.of(context).push('/login');
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          title: Text('Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19.sp,
              )),
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
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                              return 'Please enter a phone number';
                            }

                            // Use regex to validate the phone number
                            String pattern = r'^\+91[6-9]\d{9}$';
                            RegExp regExp = RegExp(pattern);
                            if (!regExp.hasMatch(value!)) {
                              return 'Please enter a valid Indian phone number';
                            }

                            return null;
                        }
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
                      SizedBox(
                        height: 10.h,
                      ),
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
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                backgroundColor:
                                    Theme.of(context).colorScheme.error,
                              ),
                            );
                          } else if (state is AuthOTPSentSuccess) {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text('Login successfull'),
                            //   ),
                            // );
                            context.go('/otp-verification');
                          }
                        },
                        builder: (context, state) {
                          return BlueButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final parts =
                                    fullNameController.text.trim().split(' ');

                                String lastName = parts.removeLast().toString();

                                String firstName = parts.join(' ');

                                if (firstName == '') {
                                  firstName = lastName;
                                  lastName = '';
                                }


                                final user = NewUserModel(
                                  firstName: firstName.trim(),
                                  lastName: lastName.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  //gender: genderController.text.toLowerCase(),
                                  // gender: genderController.text.toLowerCase(),
                                  //dob: dobController.text.trim(),
                                  phone: phoneNumberController.text.trim(),
                                  address: '',
                                  aadhaar: '',
                                  pan: '',
                                  pin: '',
                                );

                                context.read<AuthCubit>().signUp(user);
                              }
                              context.push('/otp-verification');
                            },
                            title: 'Sign up',
                           
                          );
                        },
                      ),
                      BlueButton(
                        title: 'Sign up',
                        onPressed: () {
                          if (_formKey.currentState!.validate() && isChecked) {
                           
                          } else if (!isChecked) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Please agree to the terms and conditions'),
                            ));
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context).push('/login');
                            },
                            child: const Text('Login',
                                style: TextStyle(color: mainBlueColor)),
                          ),
                        ],
                      )
                    ]),
              ),
            )));
  }
}
