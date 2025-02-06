import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class CAGRCalculator extends StatefulWidget {
  const CAGRCalculator({super.key});

  @override
  _CAGRCalculatorState createState() => _CAGRCalculatorState();
}

class _CAGRCalculatorState extends State<CAGRCalculator> {
  final TextEditingController initialController = TextEditingController();
  final TextEditingController finalController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  bool isCalculated = false;
  double initialInvestment = 0;
  double finalInvestment = 0;
  double cagrPercentage = 0;
  double cagrGains = 0;
  String timeUnit = "Years"; // Default time unit

  void calculateCAGR() {
    double p0 = double.tryParse(initialController.text) ?? 0;
    double pN = double.tryParse(finalController.text) ?? 0;
    double t = double.tryParse(durationController.text) ?? 0;

    if (p0 > 0 && pN > 0 && t > 0) {
      if (timeUnit == "Months") {
        t = t / 12; // Convert months to years
      }

      cagrPercentage = (pow((pN / p0), (1 / t)) - 1) * 100;
      cagrGains = pN - p0;
      initialInvestment = p0;
      finalInvestment = pN;

      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    initialController.clear();
    finalController.clear();
    durationController.clear();

    setState(() {
      isCalculated = false;
      initialInvestment = 0;
      finalInvestment = 0;
      cagrPercentage = 0;
      cagrGains = 0;
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Initial Investment": "${initialController.text}₹"},
        {"Final Investment": "${finalController.text}%"},
        {"Duration": "${durationController.text} $timeUnit"},
      ],
      [
        {"CARG Gains": "${cagrGains.toStringAsFixed(2)} ₹"},
        {"CARG %": "${cagrPercentage.toStringAsFixed(2)} ₹"},
      ],
      'CARG Calculator',
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
          "CAGR Calculator",
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
                      controller: initialController,
                      character: '₹',
                      hintText: 'Initial Investment',
                    ),
                    InputFieldCalculator(
                      controller: finalController,
                      character: '₹',
                      hintText: 'Final Investment',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputFieldCalculator(
                            controller: durationController,
                            character: '',
                            hintText: 'Duration',
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
                CalculateButton(onPressed: calculateCAGR),
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
              "Initial Investment", "₹${initialInvestment.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow(
              "Final Investment", "₹${finalInvestment.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow("CAGR Gains", "₹${cagrGains.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow(
              "CAGR (%) P.A", "${cagrPercentage.toStringAsFixed(2)}%"),
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
