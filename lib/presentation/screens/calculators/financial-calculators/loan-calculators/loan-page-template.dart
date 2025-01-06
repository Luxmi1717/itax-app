import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'dart:math';


class LoanPageTemplate extends StatefulWidget {
  final String title;

  const LoanPageTemplate({super.key, required this.title});

  @override
  _LoanPageTemplateState createState() => _LoanPageTemplateState();
}

class _LoanPageTemplateState extends State<LoanPageTemplate> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _tenureController = TextEditingController();

  double _emi = 0.0;
  double _totalRepayment = 0.0;

  void _calculateEMI(String amount, String r, String tenure) {
    try {
      // Safely parse inputs using double.tryParse and int.tryParse
      double? principal = double.tryParse(amount);
      double? rate = double.tryParse(r);
      int? tenureMonths = int.tryParse(tenure);

      // Validate inputs
      if (principal == null || rate == null || tenureMonths == null) {
        _showError('Please enter valid numeric values for all fields.');
        return;
      }

      rate = rate / 12 / 100; // Convert annual rate to monthly decimal rate
      double emi = (principal * rate * pow((1 + rate), tenureMonths)) /
          (pow((1 + rate), tenureMonths) - 1);
      double totalRepayment = emi * tenureMonths;

      setState(() {
        _emi = emi;
        _totalRepayment = totalRepayment;
      });
    } catch (e) {
      _showError('An error occurred during the calculation.');
    }
  }

  void _showError(String message) {
    // Show an error dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainGradient,
        ),
      ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => GoRouter.of(context).go('/all-calculators'),
        ),
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlueTextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                hintText: 'Loan Amount',
              ),
               SizedBox(
               height: 15.h,
              ),
              BlueTextField(
                controller: _rateController,
                keyboardType: TextInputType.number,
                hintText: 'Interest Rate (%)',
              ),
               SizedBox(
                height: 15.h,
              ),
              BlueTextField(
                controller: _tenureController,
                keyboardType: TextInputType.number,
                hintText: 'tenure (months)',
              ),
               SizedBox(height: 15.h),
              ElevatedButton(
                onPressed: () => _calculateEMI(
                  _amountController.text.trim(),
                  _rateController.text.trim(),
                  _tenureController.text.trim(),
                ),
                child: const Text('Calculate EMI'),
              ),
               SizedBox(height: 25.h),
              Text('Monthly EMI: ${_emi.toStringAsFixed(2)}'),
              Text('Total Repayment: ${_totalRepayment.toStringAsFixed(2)}'),
              SizedBox(height: 8.h,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      color: Colors.blue[50],
                      child: ListTile(
                        title: const Text('Monthly EMI',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(_emi.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                    Card(
                      color: Colors.blue[50],
                      child: ListTile(
                        title: const Text('Principal Amount',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(_amountController.text,
                            style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                    Card(
                      color: Colors.blue[50],
                      child: ListTile(
                        title: const Text('Total Interest',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          (_totalRepayment -
                                  (double.tryParse(_amountController.text) ??
                                      0.0))
                              .toStringAsFixed(2),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue[50],
                      child: ListTile(
                        title: const Text('Total Amount',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(_totalRepayment.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
