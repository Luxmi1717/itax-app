import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class RDCalculator extends StatefulWidget {
  const RDCalculator({super.key});

  @override
  _RDCalculatorState createState() => _RDCalculatorState();
}

class _RDCalculatorState extends State<RDCalculator> {
  final TextEditingController investmentController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController tenureController = TextEditingController();

  bool isCalculated = false;
  double investedAmount = 0;
  double interestEarned = 0;
  double totalMaturity = 0;
  String timeUnit = "Years"; // Default time unit

  void calculateRD() {
    double P = double.tryParse(investmentController.text) ?? 0;
    double annualRate = double.tryParse(rateController.text) ?? 0;
    double tenure = double.tryParse(tenureController.text) ?? 0;

    if (P > 0 && annualRate > 0 && tenure > 0) {
      double n = tenure;
      if (timeUnit == "Years") {
        n = tenure * 12; // Convert years to months
      }

      double r = (annualRate / 100) / 12; // Monthly interest rate

      totalMaturity = P * ((pow(1 + r, n) - 1) / r) * (1 + r);
      investedAmount = P * n;
      interestEarned = totalMaturity - investedAmount;

      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    investmentController.clear();
    rateController.clear();
    tenureController.clear();

    setState(() {
      isCalculated = false;
      investedAmount = 0;
      interestEarned = 0;
      totalMaturity = 0;
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Monthly Investment": "₹${investmentController.text}"},
        {"Rate of Interest (P.A)": "${rateController.text}%"},
        {"Time Period": "${tenureController.text} $timeUnit"},
      ],
      [
        {"Invested Amount": "₹${investedAmount.toStringAsFixed(2)}"},
        {"Returns": "₹${interestEarned.toStringAsFixed(2)}"},
        {"Total Amount": "₹${totalMaturity.toStringAsFixed(2)}"},
      ],
      'Recursive Deposit Calculator',
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
          "",
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
                      controller: investmentController,
                      character: '₹',
                      hintText: 'Monthly Investment',
                    ),
                    InputFieldCalculator(
                      controller: rateController,
                      character: '%',
                      hintText: 'Interest Rate (P.A.)',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldCalculator(
                            controller: tenureController,
                            character: '',
                            hintText: 'Time Period',
                          ),
                        ),
                        SizedBox(width: 10.w),
                        DropdownButton<String>(
                          value: timeUnit,
                          items: ["Years", "Months"]
                              .map((String value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              timeUnit = newValue!;
                            });
                          },
                        ),
                      ],
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
                CalculateButton(onPressed: calculateRD),
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
          _buildInfoRow(
              "Interest Earned", "₹${interestEarned.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow(
              "Total Maturity Amount", "₹${totalMaturity.toStringAsFixed(2)}"),
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
