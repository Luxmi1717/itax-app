import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class FixedDepositCalculator extends StatefulWidget {
  const FixedDepositCalculator({super.key});

  @override
  _FixedDepositCalculatorState createState() => _FixedDepositCalculatorState();
}

class _FixedDepositCalculatorState extends State<FixedDepositCalculator> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  bool isCalculated = false;
  double investedAmount = 0;
  double totalAmount = 0;
  double totalReturns = 0;
  String timeUnit = "Years"; // Default to Years

  void calculateFD() {
    double p = double.tryParse(amountController.text) ?? 0;
    double r = double.tryParse(rateController.text) ?? 0;
    double t = double.tryParse(timeController.text) ?? 0;

    if (timeUnit == "Months") {
      t = t / 12; // Convert months to years
    }

    if (p > 0 && r > 0 && t > 0) {
      totalAmount = p * (1 + (r / 100)) * t;
      totalReturns = totalAmount - p;
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
      totalAmount = 0;
      totalReturns = 0;
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Total Investment": "${amountController.text} ₹"},
        {"Expected Return Rate (P.A)": "${rateController.text}%"},
        {"Time Period": "${timeController.text} $timeUnit"},
      ],
      [
        {"Total Returns": "${totalReturns.toStringAsFixed(2)} ₹"},
        {"Total Amount": "${totalAmount.toStringAsFixed(2)} ₹"},
      ],
      'Fixed Deposit Calculator',
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
          "Fixed Deposit Calculator",
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
                CalculateButton(onPressed: calculateFD),
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
