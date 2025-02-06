import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';

class TaxCalculator extends StatefulWidget {
  const TaxCalculator({super.key});

  @override
  _TaxCalculatorState createState() => _TaxCalculatorState();
}

class _TaxCalculatorState extends State<TaxCalculator> {
  final TextEditingController panController = TextEditingController();
  final TextEditingController taxpayerTypeController = TextEditingController();
  final TextEditingController residentialStatusController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController assessmentYearController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController netIncomeController = TextEditingController();
  final TextEditingController taxPayableController = TextEditingController();
  final TextEditingController taxAfterReliefController = TextEditingController();
  final TextEditingController surchargeController = TextEditingController();
  final TextEditingController cessController = TextEditingController();
  final TextEditingController totalTaxController = TextEditingController();
  final TextEditingController section115BADController = TextEditingController();
  final TextEditingController section115BAEController = TextEditingController();
  bool section115BA = false;
  bool section115BAA = false;

  String? selectedTaxpayer;
  bool show115BAD_BAE = false;
  bool show115BA_BAA = false;
  bool showFirstLastName = false;

  final List<String> taxpayerTypes = [
    "Individual",
    "HUF",
    "AOP/BOI",
    "Foreign Company",
    "Firm/LLP",
    "Domestic Company",
    "Co-operative Society"
  ];

  void updateFields() {
    setState(() {
      showFirstLastName = selectedTaxpayer == "Individual";
      show115BAD_BAE = selectedTaxpayer == "Firm/LLP";
      show115BA_BAA = selectedTaxpayer == "Domestic Company";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tax Calculator", style: TextStyle(fontSize: 18.sp, color: Colors.white)),
        flexibleSpace: Container(decoration: const BoxDecoration(gradient: AppGradients.mainGradient)),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomInputField(label: "PAN Number", controller: panController),
                    CustomInputField(
                      label: "Taxpayer Type",
                      controller: taxpayerTypeController,
                      isDropdown: true,
                      dropdownItems: taxpayerTypes,
                      onChanged: (value) {
                        setState(() {
                          selectedTaxpayer = value;
                          taxpayerTypeController.text = value!;
                          updateFields();
                        });
                      },
                    ),
                    if (selectedTaxpayer != "Individual")
                      CustomInputField(label: "Residential Status", controller: residentialStatusController),
                    if (showFirstLastName) ...[
                      CustomInputField(label: "First Name", controller: firstNameController),
                      CustomInputField(label: "Last Name", controller: lastNameController),
                    ] else
                      CustomInputField(label: "Full Name", controller: fullNameController),
                    CustomInputField(label: "Assessment Year", controller: assessmentYearController),
                    if (selectedTaxpayer == "Individual")
                      CustomInputField(
                        label: "Gender",
                        controller: genderController,
                        isDropdown: true,
                        dropdownItems: ["Male", "Female", "Other"],
                      ),
                    CustomInputField(label: "Net Taxable Income", controller: netIncomeController, character: "₹"),
                    CustomInputField(label: "Tax Payable", controller: taxPayableController, character: "₹"),
                    CustomInputField(label: "Income Tax after Relief u/s 87A", controller: taxAfterReliefController, character: "₹"),
                    CustomInputField(label: "Surcharge", controller: surchargeController, character: "₹"),
                    CustomInputField(label: "Health and Education Cess", controller: cessController, character: "₹"),
                    CustomInputField(label: "Total Tax Liability", controller: totalTaxController, character: "₹"),
                    if (show115BAD_BAE) ...[
                      CustomInputField(label: "Opted for Section 115BAD?", controller: section115BADController, isDropdown: true, dropdownItems: ["Yes", "No"]),
                      CustomInputField(label: "Opted for Section 115BAE?", controller: section115BAEController, isDropdown: true, dropdownItems: ["Yes", "No"]),
                    ],
                    if (show115BA_BAA) ...[
                      CheckboxListTile(
                        title: Text("Company opted and qualify under Section 115BA"),
                        value: section115BA,
                        onChanged: (value) => setState(() => section115BA = value!),
                      ),
                      CheckboxListTile(
                        title: Text("Company opted and qualify under Section 115BAA"),
                        value: section115BAA,
                        onChanged: (value) => setState(() => section115BAA = value!),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClearButton(onPressed: () {}),
                CalculateButton(onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? character;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final Function(String?)? onChanged;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.character,
    this.isDropdown = false,
    this.dropdownItems,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 6.h),
          isDropdown
              ? DropdownButtonFormField<String>(
                  value: controller.text.isNotEmpty ? controller.text : null,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: dropdownItems!.map((String item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
                  onChanged: onChanged,
                )
              : TextFormField(controller: controller, decoration: InputDecoration(border: OutlineInputBorder())),
        ],
      ),
    );
  }
}
