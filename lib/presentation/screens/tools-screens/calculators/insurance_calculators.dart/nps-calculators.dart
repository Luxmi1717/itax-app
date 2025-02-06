import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class NPSCalculator extends StatefulWidget {
  const NPSCalculator({super.key});

  @override
  _NPSCalculatorState createState() => _NPSCalculatorState();
}

class _NPSCalculatorState extends State<NPSCalculator> {
  final TextEditingController monthlyInvestmentController =
      TextEditingController();
  final TextEditingController expectedReturnController =
      TextEditingController();
  final TextEditingController ageController = TextEditingController();

  bool isCalculated = false;
  bool showDownloadButton = false;
  double totalInvestment = 0;
  double interestEarned = 0;
  double maturityAmount = 0;
  double minAnnualInvestment = 6000; // NPS minimum yearly contribution

  void calculateNPS() {
    double monthlyInvestment =
        double.tryParse(monthlyInvestmentController.text) ?? 0;
    double rate =
        (double.tryParse(expectedReturnController.text) ?? 0) / 12 / 100;
    int age = int.tryParse(ageController.text) ?? 0;
    int months =
        (60 - age) * 12; // Remaining period until retirement (60 years)

    if (monthlyInvestment > 0 && rate > 0 && age > 0 && age < 60) {
      totalInvestment = monthlyInvestment * months;
      maturityAmount =
          monthlyInvestment * ((pow(1 + rate, months) - 1) / rate) * (1 + rate);
      interestEarned = maturityAmount - totalInvestment;

      setState(() {
        isCalculated = true;
        showDownloadButton = true;
      });
    }
  }

  void clearFields() {
    monthlyInvestmentController.clear();
    expectedReturnController.clear();
    ageController.clear();

    setState(() {
      isCalculated = false;
      showDownloadButton = false;
      totalInvestment = 0;
      interestEarned = 0;
      maturityAmount = 0;
    });
  }

  void downloadResults() {
    // Placeholder function for download functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Download feature coming soon!")),
    );
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Monthly Investment": "${monthlyInvestmentController.text} ₹"},
        {"Expected Return (P.A)": "${expectedReturnController.text}%"},
        {"Your Age": "${ageController.text} Years"},
     
      ],
      [
        {"Total Investment": "${totalInvestment.toStringAsFixed(2)} ₹"},
        {"Total Earned": "${interestEarned.toStringAsFixed(2)} ₹"},
        {"Maturity Amount": "${maturityAmount.toStringAsFixed(2)} ₹"},
         {"Min Annuity  Investment": "${minAnnualInvestment.toStringAsFixed(2)} ₹"},
      ],
      'NPS Calculator',
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
          "NPS Calculator",
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
                      controller: expectedReturnController,
                      character: '%',
                      hintText: 'Expected Return (P.A.)',
                    ),
                    InputFieldCalculator(
                      controller: ageController,
                      character: 'Y',
                      hintText: 'Your Age',
                    ),
                    SizedBox(height: 20.h),
                    if (isCalculated) ...[
                      SizedBox(height: 10.h),
                      Container(
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
                            _buildInfoRow("Total Investment",
                                "₹${totalInvestment.toStringAsFixed(2)}"),
                            Divider(),
                            _buildInfoRow("Interest Earned",
                                "₹${interestEarned.toStringAsFixed(2)}"),
                            Divider(),
                            _buildInfoRow("Maturity Amount",
                                "₹${maturityAmount.toStringAsFixed(2)}"),
                            Divider(),
                            _buildInfoRow("Min Annual Investment",
                                "₹${minAnnualInvestment.toStringAsFixed(2)}"),
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
                SizedBox(width: 10.w),
                CalculateButton(onPressed: calculateNPS),
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
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}
