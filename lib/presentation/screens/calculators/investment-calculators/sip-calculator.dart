import 'dart:math';

import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/presentation/widgets/blue_button.dart';

class SipCalculator extends StatefulWidget {
  const SipCalculator({super.key});

  @override
  State<SipCalculator> createState() => _SipCalculatorPageState();
}

class _SipCalculatorPageState extends State<SipCalculator> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController monthlyInvestment = TextEditingController();
  TextEditingController expectedReturnRate = TextEditingController();
  TextEditingController noOfYears = TextEditingController();

  String _investedAmount = "";
  String _estimatedReturns = "";
  String _totalValue = "";

  /// Function to calculate SIP
  void _calculateSip() {
    if (_formKey.currentState!.validate()) {
      double p = double.parse(monthlyInvestment.text); // Monthly investment
      double r =
          double.parse(expectedReturnRate.text) / 100; // Annual return rate
      int t = int.parse(noOfYears.text); // Number of years
      int n = 12; // Compounding frequency (monthly)

      // SIP Formula
      double maturityValue =
          p * ((pow(1 + r / n, n * t) - 1) / (r / n)) * (1 + r / n);
      double investedAmount = p * n * t; // Total invested amount
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
      appBar: AppBar(
        title: const Text('SIP Calculator'),
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
                text: 'Monthly Investment (₹)',
              ),
              const SizedBox(height: 15),
              BlueTextField(
                controller: monthlyInvestment,
                initialValue: monthlyInvestment.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter monthly investment';
                },
                hintText: 'Enter monthly investment',
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
                hintText: 'Enter number of years',
              ),
              const SizedBox(height: 20),
              BlueButton(
                onPressed: _calculateSip,
                title: 'Calculate SIP',
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
