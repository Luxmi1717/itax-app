// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:itax/config/colors.dart';
// import 'package:itax/cubits/auth_cubit.dart';
// import 'package:itax/cubits/auth_state.dart';
// import 'package:itax/models/new_user_model.dart';
// import 'package:itax/presentation/widgets/blue_button.dart';
// import 'package:itax/presentation/widgets/appbars/custom_appbar.dart';
// import 'package:itax/presentation/widgets/custom_text_input.dart';
// import 'package:itax/repositories/auth_repository.dart';
// import 'package:provider/provider.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   bool isChecked = false;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//         appBar: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: AppGradients.mainGradient,
//             ),
//           ),
//           leading: InkWell(
//               onTap: () {
//                 GoRouter.of(context).push('/login');
//               },
//               child: Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.white,
//               )),
//           title: Text('Sign Up',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 19.sp,
//               )),
//         ),
//         body: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Welcome to us',
//                         style: TextStyle(
//                             color: mainBlueColor,
//                             fontSize: 24.sp,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       const Text(
//                         'Hello there, Create New Account',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       SizedBox(height: 30.h),
//                       CustomTextInput(
//                         controller: firstNameController,
//                         hintText: 'First Name',
//                         ifPasswordField: false,
//                         validator: (value) =>
//                             value!.isEmpty ? 'First Name is required' : null,
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextInput(
//                         controller: lastNameController,
//                         hintText: 'Last Name',
//                         ifPasswordField: false,
//                         validator: (value) =>
//                             value!.isEmpty ? 'Last Name is required' : null,
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextInput(
//                         controller: emailController,
//                         hintText: 'Email',
//                         ifPasswordField: false,
//                         validator: (value) =>
//                             value!.contains('@') ? null : 'Enter a valid email',
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextInput(
//                         controller: phoneNumberController,
//                         hintText: 'Phone Number',
//                         ifPasswordField: false,
//                         validator: (value) {
//                           if (value != null && value.isNotEmpty) {
//                               return 'Please enter a phone number';
//                             }

//                             // Use regex to validate the phone number
//                             String pattern = r'^\+91[6-9]\d{9}$';
//                             RegExp regExp = RegExp(pattern);
//                             if (!regExp.hasMatch(value!)) {
//                               return 'Please enter a valid Indian phone number';
//                             }

//                             return null;
//                         }
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextInput(
//                         controller: passwordController,
//                         hintText: 'Password',
//                         ifPasswordField: true,
//                         validator: (value) => value!.length >= 6
//                             ? null
//                             : 'Password must be at least 6 characters',
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTextInput(
//                         controller: confirmPasswordController,
//                         hintText: 'Confirm Password',
//                         ifPasswordField: true,
//                         validator: (value) => value == passwordController.text
//                             ? null
//                             : 'Passwords do not match',
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: isChecked,
//                             onChanged: (value) {
//                               setState(() {
//                                 isChecked = value!;
//                               });
//                             },
//                           ),
//                           const Text('I agree to the terms and conditions'),
//                         ],
//                       ),
//                       BlocConsumer<AuthCubit, AuthState>(
//                         listener: (context, state) {
//                           if (state is AuthError) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(state.message),
//                                 backgroundColor:
//                                     Theme.of(context).colorScheme.error,
//                               ),
//                             );
//                           } else if (state is AuthOTPSentSuccess) {
//                             // ScaffoldMessenger.of(context).showSnackBar(
//                             //   const SnackBar(
//                             //     content: Text('Login successfull'),
//                             //   ),
//                             // );
//                             context.go('/otp-verification');
//                           }
//                         },
//                         builder: (context, state) {
//                           return BlueButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
                                


//                                 final user = NewUserModel(
//                                   firstName: firstNameController.text.trim(),
//                                   lastName: lastNameController.text.trim(),
//                                   email: emailController.text.trim(),
//                                   password: passwordController.text.trim(),
//                                   //gender: genderController.text.toLowerCase(),
//                                   // gender: genderController.text.toLowerCase(),
//                                   //dob: dobController.text.trim(),
//                                   phone: phoneNumberController.text.trim(),
//                                   address: '',
//                                   aadhaar: '',
//                                   pan: '',
//                                   pin: '',
//                                 );

//                                 context.read<AuthCubit>().signUp(user);
//                               }
//                               context.push('/otp-verification');
//                             },
//                             title: 'Sign up',
                           
//                           );
//                         },
//                       ),
//                       // BlueButton(
//                       //   title: 'Sign up',
//                       //   onPressed: () {
//                       //     if (_formKey.currentState!.validate() && isChecked) {
                           
//                       //     } else if (!isChecked) {
//                       //       ScaffoldMessenger.of(context)
//                       //           .showSnackBar(const SnackBar(
//                       //         content: Text(
//                       //             'Please agree to the terms and conditions'),
//                       //       ));
//                       //     }
//                       //   },
//                       // ),
//                       SizedBox(height: 20.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text('Already have an account?'),
//                           TextButton(
//                             onPressed: () {
//                               GoRouter.of(context).push('/login');
//                             },
//                             child: const Text('Login',
//                                 style: TextStyle(color: mainBlueColor)),
//                           ),
//                         ],
//                       )
//                     ]),
//               ),
//             )));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/auth_state.dart';
import 'package:itax/new_models/new_user_model.dart';
import 'package:itax/presentation/screens/auth/salary-or-business.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  String? _validateEmail(dynamic value) {
    if (value == null ||
        value.isEmpty ||
        !value.contains('@') ||
        !value.contains('.')) {
      _showSnackBar('Enter a valid email');
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePhoneNumber(dynamic value) {
    if (value == null || value.isEmpty) {
      _showSnackBar('Phone number is required');
      return 'Phone number is required';
    }
    const pattern = r'^\+91[6-9]\d{9}$';
    if (!RegExp(pattern).hasMatch(value)) {
      _showSnackBar('Enter a valid Indian phone number');

      return 'Enter a valid Indian phone number';
    }
    return null;
  }

  String? _validatePassword(dynamic value) {
    if (value == null || value.isEmpty) {
      _showSnackBar('Password is required');
      return 'Password is required';
    }
    if (value.length < 8) {
      _showSnackBar('Password must be at least 8 characters long');
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      _showSnackBar('Password must include at least one number');
      return 'Password must include at least one number';
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      _showSnackBar('Password must include at least one special character');
      return 'Password must include at least one special character';
    }
    return null;
  }

  String? _validateConfirmPassword(dynamic value) {
    if (value != passwordController.text) {
      _showSnackBar('Passwords do not match');
      return 'Passwords do not match';
    }
    return null;
  }

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
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontSize: 19.sp),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Hello there, Create New Account',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 30.h),
                CustomTextInput(
                  controller: firstNameController,
                  hintText: 'First Name',
                  ifPasswordField: false,
                  validator: (value) =>
                        value!.isEmpty ? 'Value Can\'t be null' : null
                          
                         

                  
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: lastNameController,
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
                  validator: _validateEmail,
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                  ifPasswordField: false,
                  validator: _validatePhoneNumber,
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: passwordController,
                  hintText: 'Password',
                  ifPasswordField: true,
                  validator: _validatePassword,
                ),
                SizedBox(height: 20.h),
                CustomTextInput(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  ifPasswordField: true,
                  validator: _validateConfirmPassword,
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
                      _showSnackBar(state.message);
                    } else if (state is AuthOTPSentSuccess) {
                      context.go('/otp-verification');
                    }
                  },
                  builder: (context, state) {
                    return BlueButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && isChecked) {
                          final user = NewUserModel(
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            phone: phoneNumberController.text.trim(),
                            address: '',
                            aadhaar: '',
                            pan: '',
                            pin: '',
                          );
                          context.read<AuthCubit>().signUp(user);
                          context.go('/otp-verification');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SalaryOrBusinessScreen(),
                            ),
                          );
                        } else if (!isChecked) {
                          _showSnackBar(
                              'Please agree to the terms and conditions');
                        }
                      },
                      title: 'Sign up',
                    );
                  },
                ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
