import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class CapitalGainCalculator extends StatefulWidget {
  const CapitalGainCalculator({super.key});

  @override
  _CapitalGainCalculatorState createState() => _CapitalGainCalculatorState();
}

class _CapitalGainCalculatorState extends State<CapitalGainCalculator> {
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController taxRateController = TextEditingController();

  bool isCalculated = false;
  double capitalGain = 0;
  double taxOwed = 0;

  void calculateCapitalGain() {
    double purchasePrice = double.tryParse(purchasePriceController.text) ?? 0;
    double salePrice = double.tryParse(salePriceController.text) ?? 0;
    double taxRate = double.tryParse(taxRateController.text) ?? 0;

    if (purchasePrice > 0 && salePrice > 0 && taxRate >= 0) {
      capitalGain = salePrice - purchasePrice;
      taxOwed = capitalGain * (taxRate / 100);

      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    purchasePriceController.clear();
    salePriceController.clear();
    taxRateController.clear();

    setState(() {
      isCalculated = false;
      capitalGain = 0;
      taxOwed = 0;
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Principal Amount": "${purchasePriceController.text}₹"},
        {"Sale Rate": "${salePriceController.text}₹"},
        {"Capital Gain": "${taxRateController.text}%"},
      ],
      [
        {"Total Capital Gains": "${capitalGain.toStringAsFixed(2)}₹"},
        {"Tax Owned": "${taxOwed.toStringAsFixed(2)}₹"},
      ],
      'Capital Gain Calculator',
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
          "Capital Gain Calculator",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        actions: [
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
                      controller: purchasePriceController,
                      character: '₹',
                      hintText: 'Purchase Price',
                    ),
                    InputFieldCalculator(
                      controller: salePriceController,
                      character: '₹',
                      hintText: 'Sale Price',
                    ),
                    InputFieldCalculator(
                      controller: taxRateController,
                      character: '%',
                      hintText: 'Capital Gain Tax Rate',
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
                CalculateButton(onPressed: calculateCapitalGain),
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
              "Total Capital Gain", "₹${capitalGain.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow("Tax Owed", "₹${taxOwed.toStringAsFixed(2)}"),
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
