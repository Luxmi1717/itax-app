import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/widgets/blue_button.dart';
import 'dart:math';

import 'package:itax/utility/tax_calculators.dart';

class IncomeTaxCalculatorScreen extends StatefulWidget {
  @override
  _IncomeTaxCalculatorScreenState createState() =>
      _IncomeTaxCalculatorScreenState();
}

class _IncomeTaxCalculatorScreenState extends State<IncomeTaxCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  // User input fields
  final TextEditingController _salaryIncomeController = TextEditingController();
  final TextEditingController _exemptAllowancesController =
      TextEditingController();
  final TextEditingController _interestIncomeController =
      TextEditingController();
  final TextEditingController _homeLoanInterestSelfOccupiedController =
      TextEditingController();
  final TextEditingController _rentalIncomeController = TextEditingController();
  final TextEditingController _homeLoanInterestLetOutController =
      TextEditingController();
  final TextEditingController _digitalAssetIncomeController =
      TextEditingController();
  final TextEditingController _otherIncomeController = TextEditingController();
  final TextEditingController _deduction80CController = TextEditingController();
  final TextEditingController _deduction80TTAController =
      TextEditingController();
  final TextEditingController _deduction80DController = TextEditingController();
  final TextEditingController _deduction80GController = TextEditingController();
  final TextEditingController _deduction80EController = TextEditingController();
  final TextEditingController _deduction80EEAController =
      TextEditingController();
  final TextEditingController _deduction80CCDController =
      TextEditingController();
  AgeCategory _selectedAgeCategory = AgeCategory.below60;

  // Results
  String _result = '';

  void _calculateTax() {
    if (_formKey.currentState!.validate()) {
      double salaryIncome = double.parse(_salaryIncomeController.text);
      double exemptAllowances = double.parse(_exemptAllowancesController.text);
      double interestIncome = double.parse(_interestIncomeController.text);
      double homeLoanInterestSelfOccupied =
          double.parse(_homeLoanInterestSelfOccupiedController.text);
      double rentalIncome = double.parse(_rentalIncomeController.text);
      double homeLoanInterestLetOut =
          double.parse(_homeLoanInterestLetOutController.text);
      double digitalAssetIncome =
          double.parse(_digitalAssetIncomeController.text);
      double otherIncome = double.parse(_otherIncomeController.text);
      double deduction80C = double.parse(_deduction80CController.text);
      double deduction80TTA = double.parse(_deduction80TTAController.text);
      double deduction80D = double.parse(_deduction80DController.text);
      double deduction80G = double.parse(_deduction80GController.text);
      double deduction80E = double.parse(_deduction80EController.text);
      double deduction80EEA = double.parse(_deduction80EEAController.text);
      double deduction80CCD = double.parse(_deduction80CCDController.text);

      // Placeholder for calculation logic
      IncomeTaxCalcResult result = calculateIncomeTax(
        salaryIncome: salaryIncome,
        exemptAllowances: exemptAllowances,
        interestIncome: interestIncome,
        homeLoanInterestSelfOccupied: homeLoanInterestSelfOccupied,
        rentalIncome: rentalIncome,
        homeLoanInterestLetOut: homeLoanInterestLetOut,
        digitalAssetIncome: digitalAssetIncome,
        otherIncome: otherIncome,
        deduction80C: deduction80C,
        deduction80TTA: deduction80TTA,
        deduction80D: deduction80D,
        deduction80G: deduction80G,
        deduction80E: deduction80E,
        deduction80EEA: deduction80EEA,
        deduction80CCD: deduction80CCD,
        ageCategory: _selectedAgeCategory,
        financialYear: 'FY 2023-2024',
      );

      setState(() {
        _result =
            'Taxable Income:   \u20B9${result.taxableIncome.toStringAsFixed(2)}\n'
            'Income Tax:   \u20B9${result.incomeTax.toStringAsFixed(2)}\n'
            'Total Tax:   \u20B9${result.totalTax.toStringAsFixed(2)}';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid inputs.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.mainGradient,
            ),
          ),
          title: Text(
            'Income Tax Calculator',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _salaryIncomeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Salary Income (Annual)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _exemptAllowancesController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Exempt Allowances',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _interestIncomeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Interest Income',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _homeLoanInterestSelfOccupiedController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Home Loan Interest (Self-Occupied)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _rentalIncomeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Rental Income',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _homeLoanInterestLetOutController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Home Loan Interest (Let-Out)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _digitalAssetIncomeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Digital Asset Income',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _otherIncomeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Other Income',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.h),
                Text(
                  'Deductions',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 18.h),
                TextFormField(
                  controller: _deduction80CController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Deduction under 80C',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _deduction80TTAController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Deduction under 80TTA',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _deduction80DController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Deduction under 80D',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _deduction80GController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Deduction under 80G',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _deduction80EController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Deduction under 80E',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _deduction80EEAController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Deduction under 80EEA',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: _deduction80CCDController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Deduction under 80CCD',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: mainBlueColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                DropdownButtonFormField<AgeCategory>(
                  value: _selectedAgeCategory,
                  items: AgeCategory.values.map((AgeCategory category) {
                    return DropdownMenuItem<AgeCategory>(
                      value: category,
                      child: Text(
                        category == AgeCategory.below60
                            ? 'Below 60'
                            : category == AgeCategory.between60and80
                                ? 'Between 60 and 80'
                                : 'Above 80',
                      ),
                    );
                  }).toList(),
                  onChanged: (AgeCategory? value) {
                    setState(() {
                      _selectedAgeCategory = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Age Category'),
                ),
                SizedBox(height: 20),
                BlueButton(
                  onPressed: _calculateTax,
                  title: 'Calculate Tax',
                ),
                SizedBox(height: 20.h),
                if (_result.isNotEmpty)
                  Container(

                    padding:  EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: mainBlueColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: mainBlueColor, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _result,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
