import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class PostOfficeMISCalculator extends StatefulWidget {
  const PostOfficeMISCalculator({super.key});

  @override
  _PostOfficeMISCalculatorState createState() =>
      _PostOfficeMISCalculatorState();
}

class _PostOfficeMISCalculatorState extends State<PostOfficeMISCalculator> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  bool isCalculated = false;
  double investedAmount = 0;
  double monthlyInterest = 0;
  double totalInterest = 0;
  double totalPayable = 0;
  String timeUnit = "Years"; // Default to Years

  void calculateMIS() {
    double p = double.tryParse(amountController.text) ?? 0;
    double r = double.tryParse(rateController.text) ?? 0;
    double t = double.tryParse(timeController.text) ?? 0;

    if (timeUnit == "Years") {
      t = t * 12; // Convert years to months
    }

    if (p > 0 && r > 0 && t > 0) {
      monthlyInterest = (p * r) / (12 * 100);
      totalInterest = monthlyInterest * t;
      totalPayable = p + totalInterest;
      investedAmount = p;

      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    amountController.clear();
    rateController.clear();
    timeController.clear();

    setState(() {
      isCalculated = false;
      investedAmount = 0;
      monthlyInterest = 0;
      totalInterest = 0;
      totalPayable = 0;
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Invested Amount":"${amountController.text} ₹"},
        {"Expected Rate of Interest": "${rateController.text}%"},
        {"Time Period": "${timeController.text} $timeUnit"},
      ],
      [
        {"Monthly Interest": "${monthlyInterest.toStringAsFixed(2)} ₹"},
        {"Total Interest": "${totalInterest.toStringAsFixed(2)} ₹"},
        {"Total Amount Payble": "${totalPayable.toStringAsFixed(2)} ₹"},
      ],
      'Post Office MIS(Monthly Income Schedule) Calculator',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("PDF saved: ${pdfFile.path}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(
        title: Text(
          "Post Office MIS(Monthly Income Schedule) Calculator",
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
                      controller: amountController,
                      character: '₹',
                      hintText: 'Invested Amount',
                    ),
                    InputFieldCalculator(
                      controller: rateController,
                      character: '%',
                      hintText: 'Expected Return Rate (P.A.)',
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
                CalculateButton(onPressed: calculateMIS),
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
              "Monthly Interest", "₹${monthlyInterest.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow(
              "Total Interest Earned", "₹${totalInterest.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow(
              "Total Payable Amount", "₹${totalPayable.toStringAsFixed(2)}"),
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
