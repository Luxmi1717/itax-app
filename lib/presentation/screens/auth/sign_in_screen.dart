import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:itax/presentation/widgets/custom_appbar.dart';
import 'package:itax/presentation/widgets/custom_text_input.dart';
import 'package:itax/repositories/auth_repository.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailOrPhoneController =
        TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: GradientAppBar(
        leadingWidget: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Login',
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
                          fontSize: 12.px,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/login-image.png',
                          width: 60.w,
                          height: 25.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomTextInput(
                      controller: emailOrPhoneController,
                      hintText: 'Email or Phone Number',
                      ifPasswordField: false,
                      validator: (value) {},
                    ),
                    const SizedBox(height: 20),
                    CustomTextInput(
                      controller: passwordController,
                      hintText: 'Password',
                      ifPasswordField: true,
                      validator: (value) {},
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
                    BlueButton(
                      title: 'Login',
                      onPressed: () async {
                        final email = emailOrPhoneController.text.trim();
                        final password = passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please enter both email and password'),
                            ),
                          );
                          return;
                        }

                        final authProvider =
                            Provider.of<AuthProvider>(context, listen: false);
                        await authProvider.login(email, password);

                        if (authProvider.errorMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(authProvider.errorMessage!),
                            ),
                          );
                        } else {
                          // Navigate to the next screen
                          Navigator.pushNamed(context, '/dashboard');
                        }
                      },
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: Text('or login with')),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.mail),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 10.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.phone),
                            onPressed: () {},
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
                          child: const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text(
                          'Sign Up',
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

  void _showForgotPasswordFlow(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ForgotPasswordStep1();
      },
    );
  }
}

class ForgotPasswordStep1 extends StatelessWidget {
  const ForgotPasswordStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final TextEditingController phoneController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 18.px,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text('Enter your mobile number or email for verification purposes'),
          SizedBox(
            height: 4.h,
          ),
          CustomTextInput(
            controller: phoneController,
            hintText: "Mobile Number or Email",
            ifPasswordField: false,
            validator: (value) {},
          ),
          SizedBox(height: 4.h),
          BlueButton(
            title: 'Send OTP',
            onPressed: () {
              Navigator.pop(context);
              authProvider.generateForgotPasswordOTP(phoneController.text);

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
        return ForgotPasswordStep2();
      },
    );
  }
}

class ForgotPasswordStep2 extends StatelessWidget {
  const ForgotPasswordStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    TextEditingController otpController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter OTP',
            style: TextStyle(
              fontSize: 18.px,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
              'Enter the 4 digits code that you received on your Mobile Number or email.'),
          SizedBox(
            height: 4.h,
          ),
          Pinput(
            length: 4,
            controller: otpController,
            defaultPinTheme: PinTheme(
              width: 40.w,
              height: 10.h,
              textStyle: TextStyle(fontSize: 20.px, color: blackColor),
            ),
          ),
          SizedBox(height: 4.h),
          BlueButton(
            title: 'Verify OTP',
            onPressed: () {
              Navigator.pop(context);
              authProvider.verifyOTP(otpController.text);

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
        return ForgotPasswordStep3();
      },
    );
  }
}

class ForgotPasswordStep3 extends StatelessWidget {
  const ForgotPasswordStep3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController ConfirmNewPasswordController =
        TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 18.px,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
              'Set the new password for your account so you can login and and access all the features.'),
          SizedBox(
            height: 2.h,
          ),
          CustomTextInput(
            controller: newPasswordController,
            hintText: "New Password",
            ifPasswordField: false,
            validator: (value) {},
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextInput(
            controller: ConfirmNewPasswordController,
            hintText: "Confirm New Password",
            ifPasswordField: false,
            validator: (value) {},
          ),
          SizedBox(height: 2.h),
          BlueButton(
            title: 'Reset Password',
            onPressed: () {
              Navigator.pop(context);
              _showForgotPasswordStep4(context);
            },
          ),
        ],
      ),
    );
  }

  void _showForgotPasswordStep4(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ForgotPasswordStep4();
      },
    );
  }
}

class ForgotPasswordStep4 extends StatelessWidget {
  const ForgotPasswordStep4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Password Updated',
            style: TextStyle(
              fontSize: 18.px,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text('Your password has been updated'),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/success.png',
                  width: 40.w, height: 20.h),
            ],
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
