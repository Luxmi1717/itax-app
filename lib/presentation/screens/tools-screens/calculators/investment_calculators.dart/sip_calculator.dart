import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class SIPCalculator extends StatefulWidget {
  const SIPCalculator({super.key});

  @override
  _SIPCalculatorState createState() => _SIPCalculatorState();
}

class _SIPCalculatorState extends State<SIPCalculator> {
  final TextEditingController monthlyInvestmentController =
      TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  bool isCalculated = false;
  double investedAmount = 0;
  double totalAmount = 0;
  double totalReturns = 0;

  void calculateSIP() {
    double p = double.tryParse(monthlyInvestmentController.text) ??
        0; // Monthly Investment
    double r = (double.tryParse(rateController.text) ?? 0) /
        100; // Annual Rate as Decimal
    double t = double.tryParse(timeController.text) ?? 0; // Time in Years

    if (p > 0 && r > 0 && t > 0) {
      int n = 12; // Monthly compounding
      double monthlyRate = r / n;
      int totalMonths = (t * 12).toInt();

      totalAmount = p *
          ((pow((1 + monthlyRate), totalMonths) - 1) / monthlyRate) *
          (1 + monthlyRate);
      investedAmount = p * totalMonths;
      totalReturns = totalAmount - investedAmount;

      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    monthlyInvestmentController.clear();
    rateController.clear();
    timeController.clear();

    setState(() {
      isCalculated = false;
      investedAmount = 0;
      totalAmount = 0;
      totalReturns = 0;
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Monthly Invested": "${monthlyInvestmentController.text} ₹"},
        {"Expected Return Rate (P.A)": "${rateController.text}%"},
        {"Time Period": "${timeController.text} Year"},
      ],
      [
        {"Invested Amount": "${investedAmount.toStringAsFixed(2)} ₹"},
        {"Total Returns": "${totalReturns.toStringAsFixed(2)} ₹"},
        {"Total Amount": "${totalAmount.toStringAsFixed(2)} ₹"},
      ],
      'SIP Calculator',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("PDF saved: ${pdfFile.path}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "SIP Calculator",
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InputFieldCalculator(
                      controller: monthlyInvestmentController,
                      character: '₹',
                      hintText: 'Monthly Investment',
                    ),
                    InputFieldCalculator(
                      controller: rateController,
                      character: '%',
                      hintText: 'Expected Return Rate (P.A.)',
                    ),
                    InputFieldCalculator(
                      controller: timeController,
                      character: 'Years',
                      hintText: 'Time Period (Years)',
                    ),
                    SizedBox(height: 20.h),
                    if (isCalculated) ...[
                      _buildResultBox(),
                    ],
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClearButton(onPressed: clearFields),
                SizedBox(width: 10.w),
                CalculateButton(onPressed: calculateSIP),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildResultBox() {
    return Container(
      width: double.infinity,
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
          _buildInfoRow(
              "Invested Amount", "₹${investedAmount.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow("Total Returns", "₹${totalReturns.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow("Total Amount", "₹${totalAmount.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
          Text(value,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
        ],
      ),
    );
  }
}
