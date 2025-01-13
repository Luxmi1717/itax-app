import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';

import '../screens/bank-and-cash-pages/cash-in-office-page.dart';

class FinancialYearWidget extends StatelessWidget {
  const FinancialYearWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
InkWell(
            onTap: (){
              
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
              child: const Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: mainBlueColor,
                  ),
                  Text('Financial Year',
                      style: TextStyle(color: blackColor, fontSize: 14)),
                  Text(' (1Apr 24 to 31 Mar 25)'),
                  Spacer(),
                  Text('Change',
                      style: TextStyle(color: mainBlueColor, fontSize: 14)),
                ],
              ),
            ),
          );
  }
}