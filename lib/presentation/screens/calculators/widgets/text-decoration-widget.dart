import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';

class textdecoration extends StatelessWidget {
  final String text;
  final double size;

  const textdecoration({
    super.key,
    required this.text,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: mainBlueColor,
        // fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
