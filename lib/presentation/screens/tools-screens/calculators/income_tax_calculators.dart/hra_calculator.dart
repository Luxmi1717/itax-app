import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class HRACalculator extends StatefulWidget {
  const HRACalculator({super.key});

  @override
  _HRACalculatorState createState() => _HRACalculatorState();
}

class _HRACalculatorState extends State<HRACalculator> {
  final TextEditingController basicSalaryController = TextEditingController();
  final TextEditingController hraReceivedController = TextEditingController();
  final TextEditingController dearnessAllowanceController =
      TextEditingController();
  final TextEditingController rentPaidController = TextEditingController();

  bool isCalculated = false;
  double hraExemption = 0;
  double taxableHRA = 0;
  String cityType = "Metro"; 

  void calculateHRA() {
    double basicSalary = double.tryParse(basicSalaryController.text) ?? 0;
    double hraReceived = double.tryParse(hraReceivedController.text) ?? 0;
    double dearnessAllowance =
        double.tryParse(dearnessAllowanceController.text) ?? 0;
    double totalRentPaid = double.tryParse(rentPaidController.text) ?? 0;

    if (basicSalary > 0 && hraReceived > 0 && totalRentPaid > 0) {
      double salaryForCalculation = basicSalary + dearnessAllowance;
      double hra50or40 = cityType == "Metro"
          ? (salaryForCalculation * 0.5)
          : (salaryForCalculation * 0.4);
      double rentMinus10Percent = totalRentPaid - (salaryForCalculation * 0.1);

      hraExemption = [hraReceived, hra50or40, rentMinus10Percent]
          .reduce((a, b) => a < b ? a : b);

      taxableHRA = hraReceived - hraExemption;

      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    basicSalaryController.clear();
    hraReceivedController.clear();
    dearnessAllowanceController.clear();
    rentPaidController.clear();

    setState(() {
      isCalculated = false;
      hraExemption = 0;
      taxableHRA = 0;
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Total Investment": "${basicSalaryController.text}₹"},
        {"HRA Received (P.A)": "${hraReceivedController.text}₹"},
        {"Dearness Amount": "${dearnessAllowanceController.text}₹"},
        {"Total Rent Paid": "${rentPaidController.text}₹"},
      ],
      [
        {"HRA Exemption": "${hraExemption.toStringAsFixed(2)}₹"},
        {"50% of Basic Salary": "${taxableHRA.toStringAsFixed(2)}₹"},
      ],
      'HRA Calculator',
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
          "HRA Calculator",
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
                      controller: basicSalaryController,
                      character: '₹',
                      hintText: 'Basic Salary',
                    ),
                    InputFieldCalculator(
                      controller: hraReceivedController,
                      character: '₹',
                      hintText: 'HRA Received (P.A)',
                    ),
                    InputFieldCalculator(
                      controller: dearnessAllowanceController,
                      character: '₹',
                      hintText: 'Dearness Allowance',
                    ),
                    InputFieldCalculator(
                      controller: rentPaidController,
                      character: '₹',
                      hintText: 'Total Rent Paid (P.A)',
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text("City Type:", style: TextStyle(fontSize: 16.sp)),
                        SizedBox(width: 10.w),
                        DropdownButton<String>(
                          dropdownColor: Colors.white,
                          value: cityType,
                          items: ["Metro", "Non-Metro"]
                              .map((String value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              cityType = newValue!;
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
                CalculateButton(onPressed: calculateHRA),
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
          _buildInfoRow("HRA Exemption", "₹${hraExemption.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow("Taxable HRA", "₹${taxableHRA.toStringAsFixed(2)}"),
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
