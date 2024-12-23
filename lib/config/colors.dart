import 'package:flutter/material.dart';

const mainBlueColor = Color.fromRGBO(60, 124, 221, 1);
const whiteColor = Colors.white;
const blackColor = Colors.black;

class AppGradients {
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromRGBO(60, 124, 221, 1), // Left color (blue)
      Color.fromRGBO(67, 206, 162, 1), // Right color (green)
    ],
  );
}
