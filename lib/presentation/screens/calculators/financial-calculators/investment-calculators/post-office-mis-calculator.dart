import 'dart:math';

import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/presentation/widgets/blue_button.dart';


class PostOfficeMissCalculator extends StatefulWidget {
  const PostOfficeMissCalculator({super.key});

  @override
  State<PostOfficeMissCalculator> createState() =>
      _LumpSumCalculatorPageState();
}

class _LumpSumCalculatorPageState extends State<PostOfficeMissCalculator> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController totalInvestment = TextEditingController();
  TextEditingController expectedReturnRate = TextEditingController();
  TextEditingController noOfYears = TextEditingController();

  String _investedAmount = "";
  String _estimatedReturns = "";
  String _totalValue = "";

  /// Function to calculate Lump Sum
  void _calculateLumpSum() {
    if (_formKey.currentState!.validate()) {
      double p = double.parse(totalInvestment.text); // Lump Sum Investment
      double r =
          double.parse(expectedReturnRate.text) / 100; // Annual Return Rate
      int t = int.parse(noOfYears.text); // Number of Years

      // Lump Sum Formula
      double maturityValue = p * pow(1 + r, t);
      double investedAmount = p; // Total Invested Amount
      double estimatedReturns = maturityValue - investedAmount; // Returns

      setState(() {
        _investedAmount = investedAmount.toStringAsFixed(2);
        _estimatedReturns = estimatedReturns.toStringAsFixed(2);
        _totalValue = maturityValue.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Post Office MIS Calculator'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const textdecoration(
                text: 'Total Investment Amount (₹)',
              ),
              const SizedBox(height: 15),
              BlueTextField(
                controller: totalInvestment,
                initialValue: totalInvestment.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter total investment amount';
                },
                hintText: 'Enter total investment amount',
              ),
              const SizedBox(height: 15),
              const textdecoration(
                text: 'Expected Return Rate (%)',
              ),
              const SizedBox(height: 15),
              BlueTextField(
                controller: expectedReturnRate,
                initialValue: expectedReturnRate.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter expected return rate';
                },
                hintText: 'Enter return rate (e.g. 12)',
              ),
              const SizedBox(height: 15),
              const textdecoration(
                text: 'No. of Years',
              ),
              const SizedBox(height: 15),
              BlueTextField(
                controller: noOfYears,
                initialValue: noOfYears.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter no. of years';
                },
                hintText: 'Normally 5 Years',
              ),
              const SizedBox(height: 20),
              BlueButton(
                onPressed: _calculateLumpSum,
                title: 'Calculate',
              ),
              const SizedBox(height: 20),
              if (_totalValue.isNotEmpty)
                Card(
                  color: Colors.blue[50],
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'Invested Amount (₹)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _investedAmount,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Estimated Returns (₹)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _estimatedReturns,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Total Value (₹)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _totalValue,
                          style: const TextStyle(fontSize: 18),
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
