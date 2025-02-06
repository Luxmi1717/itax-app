import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';
import 'dart:io';

class GSTCalculator extends StatefulWidget {
  const GSTCalculator({super.key});

  @override
  _GSTCalculatorState createState() => _GSTCalculatorState();
}

class _GSTCalculatorState extends State<GSTCalculator> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController gstRateController = TextEditingController();

  String gstType = "Exclude GST";
  bool isCalculated = false;
  double actualAmount = 0;
  double gstAmount = 0;
  double postGstAmount = 0;

  void calculateGST() {
    double amount = double.tryParse(amountController.text) ?? 0;
    double gstRate = double.tryParse(gstRateController.text) ?? 0;

    if (amount > 0 && gstRate > 0) {
      if (gstType == "Include GST") {
        actualAmount = amount / (1 + (gstRate / 100));
        gstAmount = amount - actualAmount;
        postGstAmount = amount;
      } else {
        actualAmount = amount;
        gstAmount = (amount * gstRate) / 100;
        postGstAmount = actualAmount + gstAmount;
      }

      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    amountController.clear();
    gstRateController.clear();

    setState(() {
      isCalculated = false;
      actualAmount = 0;
      gstAmount = 0;
      postGstAmount = 0;
    });
  }

  Future<void> generatePDF() async {
    List<Map<String, String>> calculationData = [
      {"Actual Amount": "₹${actualAmount.toStringAsFixed(2)}"},
      {"GST Amount": "₹${gstAmount.toStringAsFixed(2)}"},
      {"Total Amount (Post GST)": "₹${postGstAmount.toStringAsFixed(2)}"},
    ];

    File pdfFile = await TablePdfApi.generateTablePdf(
      calculationData,
      [],
      "GST Calculation Report",
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("PDF saved at: ${pdfFile.path}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:   AppBar(
        title: Text(
          "GST Calculator",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.share, color: Colors.white),
              onPressed: () {
                showDownloadPopup(context,
                    onDownloadPDF: generatePDF, onDownloadImage: () {});
              }),
          if (isCalculated)
            IconButton(
                icon: Icon(Icons.download, color: Colors.white),
                onPressed: () {
                  showDownloadPopup(context,
                      onDownloadPDF: generatePDF, onDownloadImage: () {});
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
                    DropdownButton<String>(
                      value: gstType,
                      items: ["Include GST", "Exclude GST"]
                          .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          gstType = newValue!;
                        });
                      },
                    ),
                    InputFieldCalculator(
                      controller: amountController,
                      character: '₹',
                      hintText: 'Amount',
                    ),
                    InputFieldCalculator(
                      controller: gstRateController,
                      character: '%',
                      hintText: 'GST Rate',
                    ),
                    SizedBox(height: 20.h),
                    if (isCalculated) _buildResultBox(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClearButton(onPressed: clearFields),
                SizedBox(width: 10.w),
                CalculateButton(onPressed: calculateGST),
                SizedBox(width: 10.w),
                ElevatedButton(
                  onPressed: isCalculated ? generatePDF : null,
                  child: Text("Save PDF"),
                ),
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
        boxShadow: const [
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
          _buildInfoRow("Actual Amount", "₹${actualAmount.toStringAsFixed(2)}"),
          const Divider(),
          _buildInfoRow("GST Amount", "₹${gstAmount.toStringAsFixed(2)}"),
          const Divider(),
          _buildInfoRow("Total Amount (Post GST)",
              "₹${postGstAmount.toStringAsFixed(2)}"),
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
