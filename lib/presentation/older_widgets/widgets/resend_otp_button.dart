import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/cubits/auth_cubit.dart';

class ResendOtpButton extends StatefulWidget {
  final String type;

  const ResendOtpButton({super.key, this.type = 'verification'});

  @override
  ResendOtpButtonState createState() => ResendOtpButtonState();
}

class ResendOtpButtonState extends State<ResendOtpButton> {
  bool _isTimerActive = false;
  int _secondsRemaining = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isTimerActive = true;
      _secondsRemaining = 60;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _isTimerActive = false;
          _timer?.cancel();
        }
      });
    });
  }

  void _resendOtp() {
    final auth = context.read<AuthCubit>();

    if (widget.type == 'verification') {
      auth.regenerateOTP();
    } else {
      auth.generateForgotPasswordOTP(null);
    }

    // handle resend OTP logic here
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isTimerActive ? null : _resendOtp,
      child: Text(_isTimerActive
          ? 'Resend OTP in $_secondsRemaining seconds'
          : 'Resend OTP'),
    );
  }
}
