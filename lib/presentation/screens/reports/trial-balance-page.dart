import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';

class TrialBalanceScreen extends StatelessWidget {
  const TrialBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainGradient,
        ),
      ),
      
      leading: Icon(Icons.arrow_back_ios_new, color: Colors.white),
      title:  Text('Profit and Loss', style: TextStyle(color: Colors.white, fontSize: 17.sp,)),
      actions: [
        Padding( padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h,),
        child: Icon(Icons.more_horiz, color: Colors.white),
      ),

      ],
      )
    );
  }
}