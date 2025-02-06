import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class LoanCalculatorBase extends StatefulWidget {
  final String title;
  const LoanCalculatorBase({super.key, required this.title});

  @override
  _LoanCalculatorBaseState createState() => _LoanCalculatorBaseState();
}

class _LoanCalculatorBaseState extends State<LoanCalculatorBase> {
  final TextEditingController loanController = TextEditingController();
  final TextEditingController interestController = TextEditingController();
  final TextEditingController tenureController = TextEditingController();
  bool isCalculated = false;
  double loanAmount = 0;
  double interestAmount = 0;
  double emi = 0;
  double totalPayable = 0;

  void calculateLoan() {
    double principal = double.tryParse(loanController.text) ?? 0;
    double rate = (double.tryParse(interestController.text) ?? 0) / 12 / 100;
    int tenure = (double.tryParse(tenureController.text) ?? 0).toInt() * 12;

    if (principal > 0 && rate > 0 && tenure > 0) {
      emi = (principal * rate * (pow(1 + rate, tenure))) /
          (pow(1 + rate, tenure) - 1);
      totalPayable = emi * tenure;
      interestAmount = totalPayable - principal;
      loanAmount = principal;
      setState(() {
        isCalculated = true;
      });
    }
  }

void clearFields() {
    loanController.clear();
    interestController.clear();
    tenureController.clear();

    setState(() {
      isCalculated = false;
      loanAmount = 0;
      emi = 0;
      interestAmount = 0;
      totalPayable = 0;
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Loan Amount": "${loanController.text} ₹"},
        {"Rate of Interest (P.A)": "${interestController.text}%"},
        {"Loan Tenure": "${tenureController.text} Year"},
      ],
      [
        {"EMI": "${emi.toStringAsFixed(2)} ₹"},
        {"Total Interest": "${interestAmount.toStringAsFixed(2)} ₹"},
        {"Total Amount Payble": "${      
totalPayable.toStringAsFixed(2)} ₹"},
      ],
      widget.title,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("PDF saved: ${pdfFile.path}")),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.share, color: Colors.white),
              onPressed: () {
                showDownloadPopup(context,
                    onDownloadPDF: downloadPDF, onDownloadImage: () {});
              }),
          if (isCalculated)
            IconButton(
                icon: Icon(Icons.download, color: Colors.white),
                onPressed: () {
                  showDownloadPopup(context,
                      onDownloadPDF: downloadPDF, onDownloadImage: () {});
                }),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevents unbounded height issues
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InputFieldCalculator(
                      controller: loanController,
                      character: '₹',
                      hintText: 'Loan Amount',
                    ),
                    InputFieldCalculator(
                      controller: interestController,
                      character: '%',
                      hintText: 'Interest Rate',
                    ),
                    InputFieldCalculator(
                      controller: tenureController,
                      character: 'Y',
                      hintText: 'Loan Tenure',
                    ),
                    SizedBox(height: 20.h),
                    if (isCalculated) ...[
                      SizedBox(height: 10.h),
                      Container(
                        width: double.infinity, // Maximizes the width
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow("Loan Amount",
                                "₹${loanAmount.toStringAsFixed(2)}"),
                            Divider(),
                            _buildInfoRow("EMI", "₹${emi.toStringAsFixed(2)}"),
                            Divider(),
                            _buildInfoRow("Interest Amount",
                                "₹${interestAmount.toStringAsFixed(2)}"),
                            Divider(),
                            _buildInfoRow("Total Payable",
                                "₹${totalPayable.toStringAsFixed(2)}"),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClearButton(onPressed: clearFields),
                SizedBox(width: 10.w,),
                CalculateButton(onPressed: calculateLoan),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}


Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Makes value text blue
          ),
        ),
      ],
    ),
  );
}
