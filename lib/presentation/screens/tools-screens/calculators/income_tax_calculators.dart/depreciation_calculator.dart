import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculator_item_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/download_popup_widget.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/input_feild_calculator.dart';

class DepreciationCalculator extends StatefulWidget {
  const DepreciationCalculator({super.key});

  @override
  _DepreciationCalculatorState createState() => _DepreciationCalculatorState();
}

class _DepreciationCalculatorState extends State<DepreciationCalculator> {
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController scrapValueController = TextEditingController();
  final TextEditingController usefulLifeController = TextEditingController();

  bool isCalculated = false;
  double depreciationPA = 0;
  double depreciationPercentage = 0;
  double costOfAsset = 0;
  List<Map<String, dynamic>> depreciationTable = [];

  void calculateDepreciation() {
    double purchasePrice = double.tryParse(purchasePriceController.text) ?? 0;
    double scrapValue = double.tryParse(scrapValueController.text) ?? 0;
    double usefulLife = double.tryParse(usefulLifeController.text) ?? 0;

    if (purchasePrice > 0 && usefulLife > 0 && scrapValue >= 0) {
      depreciationPA = (purchasePrice - scrapValue) / usefulLife;
      depreciationPercentage = (depreciationPA / purchasePrice) * 100;
      costOfAsset = purchasePrice;

      // Storing yearly depreciation data
      depreciationTable.clear();
      double openingValue = purchasePrice;
      for (int year = 1; year <= usefulLife; year++) {
        double yearlyDepreciation = depreciationPA;
        double closingValue = openingValue - yearlyDepreciation;
        depreciationTable.add({
          "Year": year,
          "Opening Value": openingValue.toStringAsFixed(2),
          "Depreciation": yearlyDepreciation.toStringAsFixed(2),
          "Closing Value": closingValue.toStringAsFixed(2),
        });
        openingValue = closingValue;
      }

      setState(() {
        isCalculated = true;
      });
    }
  }

  void clearFields() {
    purchasePriceController.clear();
    scrapValueController.clear();
    usefulLifeController.clear();

    setState(() {
      isCalculated = false;
      depreciationPA = 0;
      depreciationPercentage = 0;
      costOfAsset = 0;
      depreciationTable.clear();
    });
  }

   Future<void> downloadPDF() async {
    final pdfFile = await TablePdfApi.generateTablePdf(
      [
        {"Purchase Price": "${purchasePriceController.text}₹"},
        {"Scrap Value": "${scrapValueController.text}₹"},
        {"Estimated Useful  Life": "${usefulLifeController.text}% "},
      ],
      [
        {"Depreciation  (P.A)": "${depreciationPA.toStringAsFixed(2)}₹"},
        {"Depreciation Percentage": "${depreciationPercentage.toStringAsFixed(2)}%"},
        {"Cost of Asset": "${costOfAsset.toStringAsFixed(2)}₹"},
      ],
      'Depreciation Calculator',
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
          "Depreciation Calculator",
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
                      controller: purchasePriceController,
                      character: '₹',
                      hintText: 'Purchase Price',
                    ),
                    InputFieldCalculator(
                      controller: scrapValueController,
                      character: '₹',
                      hintText: 'Scrap Value',
                    ),
                    InputFieldCalculator(
                      controller: usefulLifeController,
                      character: 'Y',
                      hintText: 'Estimated Useful Life',
                    ),
                    SizedBox(height: 20.h),
                    if (isCalculated) ...[
                      _buildResultBox(),
                      SizedBox(height: 20.h),
                      _buildDepreciationTable(),
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
                CalculateButton(onPressed: calculateDepreciation),
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
          _buildInfoRow(
              "Depreciation (P.A)", "₹${depreciationPA.toStringAsFixed(2)}"),
          Divider(),
          _buildInfoRow("Depreciation Percentage",
              "${depreciationPercentage.toStringAsFixed(2)}%"),
          Divider(),
          _buildInfoRow("Cost of Asset", "₹${costOfAsset.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

  Widget _buildDepreciationTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Depreciation Schedule",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text("Year")),
              DataColumn(label: Text("Opening Value")),
              DataColumn(label: Text("Depreciation")),
              DataColumn(label: Text("Closing Value")),
            ],
            rows: depreciationTable.map((entry) {
              return DataRow(cells: [
                DataCell(Text(entry["Year"].toString())),
                DataCell(Text("₹${entry["Opening Value"]}")),
                DataCell(Text("₹${entry["Depreciation"]}")),
                DataCell(Text("₹${entry["Closing Value"]}")),
              ]);
            }).toList(),
          ),
        ),
      ],
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
