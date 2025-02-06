import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itax/config/colors.dart';

import 'package:itax/presentation/screens/calculators/financial-calculators/investment-calculators/lump-sum-calculator.dart';
import 'package:itax/presentation/screens/calculators/financial-calculators/investment-calculators/rd-calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/bank_calculators.dart/compound_interest_calculators.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/bank_calculators.dart/simple_interest_calculators.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/gst_calculators.dart/gst_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/income_tax_calculators.dart/advance_tax_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/income_tax_calculators.dart/capital_gain_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/income_tax_calculators.dart/depreciation_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/income_tax_calculators.dart/hra_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/insurance_calculators.dart/nps-calculators.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/investment_calculators.dart/cagr_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/investment_calculators.dart/fd_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/investment_calculators.dart/post_office_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/investment_calculators.dart/sip_calculator.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/loan_calculators.dart/loan_calculator_base.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/income_tax_calculators.dart/tax_calculator.dart';


class CalculatorToolsScreen extends StatelessWidget {
  const CalculatorToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
       
        title: Text('Tools',
            style: TextStyle(color: Colors.white, fontSize: 20.sp)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 14.h),
              GridView.count(
                crossAxisCount: 3,

                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 40.h,
                crossAxisSpacing: 16.w, 
                children: List.generate(calculatorToolsList.length, (index) {
                  return NavigationItemTile(
                    item: calculatorToolsList[index],
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r),
                          ),
                        ),
                        builder: (context) {
                          return calculatorToolsList[index].bottomSlider;
                        },
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

/// Navigation Tile Component
class NavigationItemTile extends StatelessWidget {
  final NavigationItemCalc item;
  final VoidCallback onTap;

  const NavigationItemTile({required this.item, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            height: 55.h, // Increased height
            width: 100.w, // Increased width
            child: SvgPicture.asset(
              item.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
         
          Text(
            item.name,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


/// Sample Data
final List<NavigationItemCalc> calculatorToolsList = [
  NavigationItemCalc(
      id: 1,
      imageUrl: 'assets/images/calculators/calc1.svg',
      bottomSlider: BottomSlideBank(itemList: bankCalcList),
      name: 'Bank Calculators'),
  NavigationItemCalc(
      id: 2,
      imageUrl: 'assets/images/calculators/calc2.svg',
      bottomSlider: BottomSliderIncomeTax(itemList: incomeTaxCalcList),
      name: 'Income Tax Calculators'),
  NavigationItemCalc(
      id: 3,
      imageUrl: 'assets/images/calculators/calc3.svg',
      bottomSlider: const BottomSliderGST(),
      name: 'GST Calculators'),
  NavigationItemCalc(
      id: 4,
      imageUrl: 'assets/images/calculators/calc4.svg',
      bottomSlider: BottomSliderInvestment(itemList: investmentCalcList),
      name: 'Investment Calculators'),
  NavigationItemCalc(
      id: 5,
      imageUrl: 'assets/images/calculators/calc5.svg',
      bottomSlider: BottomSlideBankLoan(itemList: loanTaxCalcList),
      name: 'Loan Calculators'),
  NavigationItemCalc(
      id: 6,
      imageUrl: 'assets/images/calculators/calc6.svg',
      bottomSlider: BottomSlideInsurance(itemList: insuranceCalcList),
      name: 'Insurance Calculators'),
];

class NavigationItemCalc {
  final int id;
  final String imageUrl;
  final Widget bottomSlider;
  final String name;

  NavigationItemCalc({
    required this.id,
    required this.imageUrl,
    required this.bottomSlider,
    required this.name,
  });
}

class BottomSliderIncomeTax extends StatelessWidget {
  final List<BottomSliderItem> itemList;
  const BottomSliderIncomeTax({Key? key, required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Text('Income Tax Calculators',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(incomeTaxCalcList.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => itemList[index].navigationPath,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 8.h), // Increased margin to prevent crowding
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${itemList[index].name}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey.shade700),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class BottomSliderGST extends StatelessWidget {

  const BottomSliderGST({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Text('GST Calculators',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                )),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children:[
             InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GSTCalculator(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 8.h), // Increased margin to prevent crowding
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GST Calculator',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey.shade700),
                    ],
                  ),
                ),
              )
            
          ]
          ),
        ],
      )
    );
  }
}
class BottomSliderInvestment extends StatelessWidget {
  final List<BottomSliderItem> itemList;

  const BottomSliderInvestment({Key? key, required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Column(
           children: [Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Text('Investment Calculators',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(investmentCalcList.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => itemList[index].navigationPath,
                      ),
                    );
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.h), // Increased margin to prevent crowding
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(0, 4),
                              blurRadius: 6,
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${itemList[index].name}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey.shade700),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
      
           ]
        ),
      ),
    );
  }
}

class BottomSlideBank extends StatelessWidget {
  final List<BottomSliderItem> itemList;
  const BottomSlideBank({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: 
      Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Text('Bank Calculators',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      )),
                ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(bankCalcList.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => itemList[index].navigationPath,
                    ),
                  );
                },
                child: 
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 8.h), // Increased margin to prevent crowding
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(0, 4),
                            blurRadius: 6,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${itemList[index].name}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey.shade700),
                        ],
                      ),
                    ),
                  
                );
              
            }),
          ),
        ],
      ),
    );
  }
}

class BottomSlideInsurance extends StatelessWidget {
  final List<BottomSliderItem> itemList;
  const BottomSlideInsurance({Key? key, required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => itemList[0].navigationPath,
          ),
        );
      },
      child: Container(
color: Colors.white,        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Text('Insurance Calculators',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(insuranceCalcList.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => itemList[index].navigationPath,
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 8.h), // Increased margin to prevent crowding
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(0, 4),
                            blurRadius: 6,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${itemList[index].name}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey.shade700),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSlideBankLoan extends StatelessWidget {
  final List<BottomSliderItem> itemList;
  const BottomSlideBankLoan({Key? key, required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Text('Loan Calculators',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(loanTaxCalcList.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => itemList[index].navigationPath,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 8.h), // Increased margin to prevent crowding
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${itemList[index].name}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey.shade700),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class BottomSliderItem {
  final int id;
  final  navigationPath;
  final String name;

  BottomSliderItem({
    required this.id,
    required this.navigationPath,
    required this.name,
  });
}


final List<BottomSliderItem> incomeTaxCalcList = [
  BottomSliderItem(id: 1, navigationPath: const HRACalculator(), name: 'HRA Calculator'),
  BottomSliderItem(
      id: 2, navigationPath: const DepreciationCalculator(), name: 'Depreciation Calculator'),
  BottomSliderItem(
      id: 3,
      navigationPath:AdvancedTaxCalculator(),
      name: 'Advance Tax Calculator(Old)'),
  BottomSliderItem(id: 4, navigationPath: const TaxCalculator(), name: 'Tax Calculator'),
  BottomSliderItem(
      id: 5, navigationPath: const CapitalGainCalculator(), name: 'Capital Gain Calculator'),
];


final List<BottomSliderItem> investmentCalcList = [
  BottomSliderItem(id: 1, navigationPath: const PostOfficeMISCalculator(), name: 'Post Office MIS'),
  BottomSliderItem(id: 2, navigationPath: const CAGRCalculator(), name: 'CAGR Calculator'),
  BottomSliderItem(
      id: 3, navigationPath: const RDCalculator(), name: 'RD Calculator'),
  BottomSliderItem(id: 4, navigationPath: const FixedDepositCalculator(), name: 'FD Calculator'),
  BottomSliderItem(id: 5, navigationPath: const LumpSumCalculator(), name: 'Lump Sum Calculator'),
  BottomSliderItem(id: 6, navigationPath: const SIPCalculator(), name: 'SIP Calculator'),
];

final List<BottomSliderItem> bankCalcList = [
  BottomSliderItem(
      id: 1, navigationPath: const SimpleInterestCalculator(), name: 'Simple Interest Calculator'),
  BottomSliderItem(id: 2, navigationPath: const CompoundInterestCalculator(), name: 'Compound Interest'),
];

final List<BottomSliderItem> insuranceCalcList = [
  BottomSliderItem(id: 1, navigationPath:const NPSCalculator(), name: 'NPS Calculator '),
];

final List<BottomSliderItem> loanTaxCalcList = [
  BottomSliderItem(
      id: 1, navigationPath: const LoanCalculatorBase(title: 'Business Loan Calculator',), name: 'Business Loan Calculator'),
  BottomSliderItem(id: 2,
      navigationPath: const LoanCalculatorBase(
        title: 'Car Loan Calculator',
      ), name: 'Car Loan Calculator'),
  BottomSliderItem(
      id: 3, navigationPath: const LoanCalculatorBase(title: 'Loan Against Property',), name: 'Loan Against Property'),
  BottomSliderItem(
      id: 4, navigationPath: const LoanCalculatorBase(
        title: 'Home Loan Calculator',
      ), name: 'Home Loan Calculator'),                                                       
  BottomSliderItem(
      id: 5, navigationPath: const LoanCalculatorBase(
        title: 'Personal Loan Calculator',
      ), name: 'Personal Loan Calculator'),
];
