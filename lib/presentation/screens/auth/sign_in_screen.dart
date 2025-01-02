import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/auth_state.dart';
import 'package:itax/presentation/screens/bottom-navigation/dashboard-navigation.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/appbars/custom_appbar.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailOrPhoneController =
        TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: GradientAppBar(
        leadingWidget: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
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
                      'Welcome Back',
                      style: TextStyle(
                          color: mainBlueColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hello there, Login to continue',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/login-image.png',
                          width: 150.w,
                          height: 150.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    CustomTextInput(
                      controller: emailOrPhoneController,
                      hintText: 'Email or Phone Number',
                      ifPasswordField: false,
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextInput(
                      controller: passwordController,
                      hintText: 'Password',
                      ifPasswordField: true,
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text('Remember me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            _showForgotPasswordFlow(context);
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: mainBlueColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                        } else if (state is AuthSuccess) {
                          GoRouter.of(context).push('/home');
                          final user =
                              context.read<AuthCubit>().getLoggedInUser();
                          print(user.data?.email ?? "");
                          // context.push('/otp-verification');
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('OTP Sent to your email.'),
                          //   ),
                          // );
                        }
                      },
                      builder: (context, state) {
                        return BlueButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().generateOTP(
                                  emailOrPhoneController.text,
                                  passwordController.text);
                            }
                          },
                          title: 'Login',
                        );
                      },
                    ),
                    // BlueButton(
                    //   title: 'Login',
                    //   onPressed: () async {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => BottomNavBarDashBoard()));
                       
                    //   },
                    // ),
                    SizedBox(height: 20.h),
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 40.h),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 4.w),
                              height: 1,
                              color: blackColor,
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Center(child: Text('or login with')),
                          SizedBox(width: 8.w,),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 4.w),
                              height: 1,
                              color: blackColor,
                            ),
                          ),
                        ],
                                           ),
                     ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/google-logo.png',
                              width: 40.w,
                              height: 40.h,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 70.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/facebook-logo.png',
                              width: 40.w,
                              height: 40.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Don't have an account?",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).push('/signup');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: mainBlueColor, fontSize: 18.sp),
                          ),
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

  void _showForgotPasswordFlow(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ForgotPasswordStep1();
      },
    );
  }
}

class ForgotPasswordStep1 extends StatelessWidget {
  const ForgotPasswordStep1({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController phoneController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text(
              'Enter your mobile number or email for verification purposes'),
          SizedBox(
            height: 16.h,
          ),
          CustomTextInput(
            controller: phoneController,
            hintText: "Mobile Number or Email",
            ifPasswordField: false,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 16.h),
          BlueButton(
            title: 'Send OTP',
            onPressed: () {
              Navigator.pop(context);

              _showForgotPasswordStep2(context);
            },
          ),
        ],
      ),
    );
  }

  void _showForgotPasswordStep2(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ForgotPasswordStep2();
      },
    );
  }
}

class ForgotPasswordStep2 extends StatelessWidget {
  const ForgotPasswordStep2({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController otpController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter OTP',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text(
              'Enter the 4 digits code that you received on your Mobile Number or email.'),
          SizedBox(
            height: 16.h,
          ),
          Pinput(
            length: 4,
            controller: otpController,
            defaultPinTheme: PinTheme(
              width: 50.w,
              height: 50.h,
              textStyle: TextStyle(fontSize: 18.sp, color: blackColor),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onCompleted: (pin) {
              print("Entered OTP: $pin");
            },
          ),
          SizedBox(height: 16.h),
          BlueButton(
            title: 'Verify OTP',
            onPressed: () {
              Navigator.pop(context);

              _showForgotPasswordStep3(context);
            },
          ),
        ],
      ),
    );
  }

  void _showForgotPasswordStep3(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ForgotPasswordStep3();
      },
    );
  }
}

class ForgotPasswordStep3 extends StatelessWidget {
  const ForgotPasswordStep3({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController ConfirmNewPasswordController =
        TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            const Text(
                'Set the new password for your account so you can login and and access all the features.'),
            SizedBox(
              height: 16.h,
            ),
            CustomTextInput(
              controller: newPasswordController,
              hintText: "New Password",
              ifPasswordField: false,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextInput(
              controller: ConfirmNewPasswordController,
              hintText: "Confirm New Password",
              ifPasswordField: false,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: 16.h),
            BlueButton(
              title: 'Reset Password',
              onPressed: () {
                Navigator.pop(context);
                _showForgotPasswordStep4(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showForgotPasswordStep4(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ForgotPasswordStep4();
      },
    );
  }
}

class ForgotPasswordStep4 extends StatelessWidget {
  const ForgotPasswordStep4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Password Updated',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Text('Your password has been updated'),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/success.png',
                  width: 70.w, height: 40.h),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          BlueButton(
            title: 'Login',
            onPressed: () {
              try {
                Navigator.pop(context);
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
