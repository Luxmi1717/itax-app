import 'package:flutter/material.dart';
showTopSnackBar(
{ required BuildContext context,
    required String msg,
      Duration? duration,
  Color? bgColor
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      duration: duration ?? const Duration(milliseconds: 1000),
      backgroundColor: bgColor??Colors.teal,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10),
      behavior: SnackBarBehavior.floating,
      //  width: 200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Text(
        msg,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    ),
  );
}
