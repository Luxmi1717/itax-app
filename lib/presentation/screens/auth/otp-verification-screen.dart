
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/auth_state.dart';
import 'package:itax/models/forgot_password_state.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:pinput/pinput.dart';


class OTPVerificationScreen extends StatefulWidget {
  final ForgotPasswordState? routeState;

  const OTPVerificationScreen({super.key, this.routeState});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            width: double.maxFinite,
            height: height,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 32,
                ),
                const SizedBox(height: 32),
                const Text(
                  'Please enter OTP sent to your email',
                  // style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 32,
                ),
                Pinput(
                  autofocus: true,
                  length: 6,
                  controller: otpController,
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                      );
                    } else if (state is AuthSuccess) {
                      final redirectToChangePassword =
                          widget.routeState?.redirectToChangePassword;
                      if (redirectToChangePassword == null) {
                        context.go('/home');
                      } else {
                        context.go('/change-password');
                      }
                    }
                  },
                  builder: (context, state) {
                    return BlueButton(
                      onPressed: () {
                        final authCubit = context.read<AuthCubit>();

                        print(widget.routeState);

                        if (widget.routeState?.redirectToChangePassword !=
                            null) {
                          authCubit.verifyForgotPasswordOTP(
                            otpController.text,
                          );
                        } else {
                          authCubit.verifyOTP(otpController.text);
                        }
                      },
                      title: 'Verify',
                      
                    );
                  },
                ),
                const SizedBox(height: 16),
                // ResendOtpButton(
                //   type: (widget.routeState?.redirectToChangePassword != null &&
                //           widget.routeState?.redirectToChangePassword != false)
                //       ? 'VERIFICATION'
                //       : 'FORGET',
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
