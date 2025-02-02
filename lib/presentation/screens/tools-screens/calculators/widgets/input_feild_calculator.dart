import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFieldCalculator extends StatelessWidget {
  final TextEditingController controller;
  final String character;
  final String hintText;


  InputFieldCalculator({required this.controller, required this.character, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h ),
            child: Text(
              hintText,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ),
      
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height:45.h,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 125, 124, 124), width: 1),
              
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      
                    ),
                  ),
                ),
               Container(
                width: 1,
                height: 50.h,
              color: const Color.fromARGB(255, 125, 124, 124),
               ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    character,
                    style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}