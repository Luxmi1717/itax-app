import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/all-banks-page.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/date-filter-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sort-by-slider-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-1-tile.dart';

class ProfitLossReportPage extends StatelessWidget {
  const ProfitLossReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        leading: Padding(
          padding:  EdgeInsets.all(8.w),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        
        actions: [
          InkWell(
            onTap: (){
              openBottomSheet(context, const SortByOptionsSlider());
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w,),
              child: const Icon(Icons.more_horiz, color: Colors.white, ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: InkWell(
                onTap: () {
                  openBottomSheet(context, const DateOptionsSlider());
                },
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
            ),
            const Divider(thickness: 3),
             SizedBox(height: 20.h),
             Padding(padding: 
             EdgeInsets.symmetric(horizontal: 20.w),
             child: const Column(children: [
              TileTypeOne(leadingText: 'Sales Accounts', trailingText: '₹ 11,10,200'),
              TileTypeOne(leadingText: 'Purchase Accounts', trailingText: '₹ 7,05,200'),
              TileTypeOne(leadingText: 'Direct Income', trailingText: ' ₹ 90,500'),
              TileTypeOne(leadingText: 'Direct Expenses', trailingText: '₹ 1,11,200'),
              TileTypeOne(leadingText: 'Opening Stocks', trailingText: '₹ 5,10,000'),
             ],),
             ),
             Container(
              color: mainBlueColor,
               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
               width: double.infinity,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Gross Profit', style: TextStyle(fontSize: 16.sp,color: whiteColor ),),
                   Text('₹ 1,50,000', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: whiteColor),),
                 ],
               ),
             ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: const Column(
                children: [
                  TileTypeOne(
                      leadingText: 'Other Income',
                      trailingText: '₹ 11,10,200'),
                  TileTypeOne(
                      leadingText: 'Indirect Expenses',
                      trailingText: '₹ 7,05,200'),
                  
                ],
              ),
            ),

            Container(
              color: mainBlueColor,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Net Profit',
                    style: TextStyle(fontSize: 16.sp, color: whiteColor),
                  ),
                  Text(
                    '₹ ₹ 7,22,200',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

