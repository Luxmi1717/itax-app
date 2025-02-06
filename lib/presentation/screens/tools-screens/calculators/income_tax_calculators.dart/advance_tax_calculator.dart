import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/calculate_button.dart';
import 'package:itax/presentation/screens/tools-screens/calculators/widgets/clear_button.dart';



class AdvancedTaxCalculator extends StatefulWidget {
  @override
  _AdvancedTaxCalculatorState createState() => _AdvancedTaxCalculatorState();
}

class _AdvancedTaxCalculatorState extends State<AdvancedTaxCalculator> {
  final TextEditingController panController = TextEditingController();
  final TextEditingController taxpayerTypeController = TextEditingController();
  final TextEditingController netIncomeController = TextEditingController();
  final TextEditingController taxController = TextEditingController();
  final TextEditingController surchargeController = TextEditingController();
  final TextEditingController cessController = TextEditingController();
  final TextEditingController totalTaxController = TextEditingController();
  final TextEditingController reliefController = TextEditingController();
  final TextEditingController tdsController = TextEditingController();
  final TextEditingController assessedTaxController = TextEditingController();
  final TextEditingController section115BACController = TextEditingController();

  String? selectedTaxpayer;
  bool show115BAC = false;

  final List<String> taxpayerTypes = [
    "Individual",
    "Domestic Company",
    "Foreign Company",
    "Firms/LLP Advanced",
    "Co-operative Society",
    "HUF (Hindu Undivided Family)",
    "AOP/BOI"
  ];

  void updateFields() {
    setState(() {
      show115BAC = selectedTaxpayer == "Co-operative Society" ||
          selectedTaxpayer == "HUF (Hindu Undivided Family)" ||
          selectedTaxpayer == "AOP/BOI";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Advance Tax Calculator",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        
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
        padding: EdgeInsets.symmetric(horizontal:  22.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInputField(
                      label: "PAN Number",
                      controller: panController,
                      keyboardType: TextInputType.text,
                    ),
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
                    if (show115BAC)
                      CustomInputField(
                        label: "Opting for Taxation under Section 115BAC?",
                        controller: section115BACController,
                        isDropdown: true,
                        dropdownItems: ["Yes", "No"],
                        onChanged: (value) {
                          section115BACController.text = value!;
                        },
                      ),
                    CustomInputField(
                        label: "Net Taxable Income",
                        controller: netIncomeController,
                        keyboardType: TextInputType.number),
                    CustomInputField(
                        label: "Income Tax",
                        controller: taxController,
                        keyboardType: TextInputType.number),
                    CustomInputField(
                        label: "Surcharge",
                        controller: surchargeController,
                        keyboardType: TextInputType.number),
                    CustomInputField(
                        label: "Health and Education Cess",
                        controller: cessController,
                        keyboardType: TextInputType.number),
                    CustomInputField(
                        label: "Total Tax Liability",
                        controller: totalTaxController,
                        keyboardType: TextInputType.number),
                    CustomInputField(
                        label: "Relief",
                        controller: reliefController,
                        keyboardType: TextInputType.number),
                    CustomInputField(
                        label: "TDS/TCS/MAT(AMT) Credit Utilized",
                        controller: tdsController,
                        keyboardType: TextInputType.number),
                    CustomInputField(
                        label: "Assessed Tax",
                        controller: assessedTaxController,
                        keyboardType: TextInputType.number),
                    SizedBox(height: 20.h),
                    
                  ],
                ),
              ),
            ),
            
             
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClearButton(onPressed: (){}),
                SizedBox(width: 10.w),
                CalculateButton(onPressed: (){}),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),

      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final Function(String?)? onChanged;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isDropdown = false,
    this.dropdownItems,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            label,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: isDropdown
                ? DropdownButtonFormField<String>(
                    value: controller.text.isNotEmpty ? controller.text : null,
                    decoration: _inputDecoration(),
                    items: dropdownItems!.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: onChanged,
                  )
                : TextFormField(
                    controller: controller,
                    keyboardType: keyboardType,
                    decoration: _inputDecoration(),
                  ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    );
  }
}
