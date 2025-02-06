import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class SimpleInterestCalculator extends StatefulWidget {
  const SimpleInterestCalculator({super.key});

  @override
  _SimpleInterestCalculatorState createState() =>
      _SimpleInterestCalculatorState();
}

class _SimpleInterestCalculatorState extends State<SimpleInterestCalculator> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  bool isCalculated = false;
  double principal = 0;
  double totalEarned = 0;
  double totalAmount = 0;
  String timeUnit = "Years";

  void calculateSimpleInterest() {
    double p = double.tryParse(principalController.text) ?? 0;
    double r = double.tryParse(rateController.text) ?? 0;
    double t = double.tryParse(timeController.text) ?? 0;

    if (timeUnit == "Months") {
      t = t / 12;
    }

    if (p > 0 && r > 0 && t > 0) {
      totalEarned = (p * r * t) / 100;
      totalAmount = p + totalEarned;
      principal = p;
      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    principalController.clear();
    rateController.clear();
    timeController.clear();
    setState(() {
      isCalculated = false;
      principal = 0;
      totalEarned = 0;
      totalAmount = 0;
    });
  }

  Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Principal Amount": "₹${principalController.text}"},
        {"Rate of Interest": "${rateController.text}%"},
        {"Time Period": "${timeController.text} $timeUnit"},
      ],
      [
        {"Principal Amount": "₹${principal.toStringAsFixed(2)}"},
        {"Total Earned": "₹${totalEarned.toStringAsFixed(2)}"},
        {"Total Amount": "₹${totalAmount.toStringAsFixed(2)}"},
      ],
      'Simple Interest Calculator',
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
          "Simple Interest Calculator",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        actions: [
          if (isCalculated)
            IconButton(
              icon: Icon(Icons.download, color: Colors.white),
              onPressed: (){
                 showDownloadPopup( context, onDownloadPDF: downloadPDF, onDownloadImage: (){});
              }
            ),
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
                      controller: principalController,
                      character: '₹',
                      hintText: 'Principal Amount',
                    ),
                    InputFieldCalculator(
                      controller: rateController,
                      character: '%',
                      hintText: 'Rate of Interest (P.A.)',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldCalculator(
                            controller: timeController,
                            character: '',
                            hintText: 'Time Period',
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 78.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40.h,
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                    value: timeUnit,
                                    items: ["Years", "Months"]
                                        .map((String value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        timeUnit = newValue!;
                                      });
                                    },
                                    icon: Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                CalculateButton(onPressed: calculateSimpleInterest),
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
          _buildInfoRow("Principal Amount", "₹${principal.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow("Total Earned", "₹${totalEarned.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow("Total Amount", "₹${totalAmount.toStringAsFixed(2)}"),
        ],
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
