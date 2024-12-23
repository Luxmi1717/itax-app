
import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/main.dart';
import 'package:sizer/sizer.dart';

class BlueButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const BlueButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: whiteColor, fontSize: 16.px)),
      ),
    );
  }
}