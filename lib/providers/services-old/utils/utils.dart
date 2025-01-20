import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
 static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 20,
    );

  }
 static const String rupesSymbol = "₹";
  static void flushbarErrorMessage(String messages,BuildContext context){
   showFlushbar(context: context, flushbar: Flushbar(
     forwardAnimationCurve: Curves.decelerate,
     message: messages,
     backgroundColor: Colors.redAccent,
     duration: const Duration(seconds: 5),
     flushbarPosition:FlushbarPosition.TOP ,
     reverseAnimationCurve: Curves.easeInOut,
     icon:const Icon(Icons.error,size: 28,color: Colors.black,),
     positionOffset: 5,
   )..show(context),
   );
   
   
  }
  static snakBar(String message,BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
          content: Text(message)));
  }
 static bool validateEmail(String? email) {
   // Regular expression for email validation
   final RegExp emailRegExp =
   RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

   // Use the RegExp `hasMatch` method to check if the email matches the pattern
   return emailRegExp.hasMatch(email ?? "");
 }

 static bool validateMobileNumber(String? mobileNumber) {
   final RegExp mobileRegExp = RegExp(r'^[0-9]{10}$');

   return mobileRegExp.hasMatch(mobileNumber ?? "");
 }

 static bool validateGSTNumber(String? gstNumber) {
   // Regular expression for GST number validation (Indian format)
   final RegExp gstRegExp = RegExp(
       r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$');

   // Use the RegExp `hasMatch` method to check if the GST number matches the pattern
   return gstRegExp.hasMatch(gstNumber ?? "");
 }

 static bool validatePANNumber(String? panNumber) {
   // Regular expression for PAN number validation (Indian format)
   final RegExp panRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');

   // Use the RegExp `hasMatch` method to check if the PAN number matches the pattern
   return panRegExp.hasMatch(panNumber ?? "");
 }
 double convertPercentageToDouble(String percentage) {
   try {

     return double.parse(percentage.replaceAll('%', ''));
   } catch (e) {

     print('Error parsing double: $e');
     return 0.0;
   }
 }

}