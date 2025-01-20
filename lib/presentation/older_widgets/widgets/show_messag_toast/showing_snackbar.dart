import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String msg,
  Color ?backgroundColor,
  Color? textColor
}) {
  final snackBar = SnackBar(

    content: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 5),
      child: Text(
        msg,
        textAlign: TextAlign.start,
        //style: kBodyStyle,
        style: TextStyle(
              color: textColor??Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: backgroundColor??Colors.red, //: Colors.green,
    // width: 340.0,
    padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 20.0),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),

    // action: SnackBarAction(
    //   label: 'Undo',
    //   textColor: Colors.white,
    //   onPressed: () {},
    // ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
