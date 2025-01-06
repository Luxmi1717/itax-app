import 'dart:math';
import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/presentation/widgets/blue_button.dart';


class PensionCalculator extends StatefulWidget {
  const PensionCalculator({super.key});

  @override
  State<PensionCalculator> createState() => _PensionCalculatorState();
}

class _PensionCalculatorState extends State<PensionCalculator> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController monthlyContribution = TextEditingController();
  TextEditingController annualReturn = TextEditingController();
  TextEditingController currentAge = TextEditingController();

  String _totalInvestment = "";
  String _interestEarned = "";
  String _maturityAmount = "";
  String _minAnnuityInvestment = "";

  /// Function to calculate pension amounts
  void _calculatePension(String monthly, String annual, String Currage) {
    if (_formKey.currentState!.validate()) {
      double contribution = double.parse(monthly);
      double rateOfInterest = double.parse(annual) / 100;
      int age = int.parse(Currage);
      int tenure = 60 - age; // Assuming retirement age is 60
      double principal = contribution * tenure * 12;

      // Compound Interest Formula: A = P(1 + r/n)^(nt)
      double maturity = 0;
      for (int i = 0; i < tenure * 12; i++) {
        maturity +=
            contribution * pow((1 + rateOfInterest / 12), tenure * 12 - i);
      }

      double interest = maturity - principal;
      double annuityInvestment = maturity * 0.4; // Minimum 40% for annuity

      setState(() {
        _totalInvestment = principal.toStringAsFixed(2);
        _interestEarned = interest.toStringAsFixed(2);
        _maturityAmount = maturity.toStringAsFixed(2);
        _minAnnuityInvestment = annuityInvestment.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pension Calculator'),
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
                text: 'Monthly Contribution (₹)',
              ),
              const SizedBox(
                height: 15,
              ),
              BlueTextField(
                controller: monthlyContribution,
                initialValue: monthlyContribution.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter monthly contribution';
                },
                hintText: 'Enter monthly contribution',
              ),
              const SizedBox(
                height: 15,
              ),
              const textdecoration(
                text: 'Annual Return (%)',
              ),
              const SizedBox(
                height: 15,
              ),
              BlueTextField(
                controller: annualReturn,
                initialValue: annualReturn.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter annual return';
                },
                hintText: 'Enter annual return',
              ),
              const SizedBox(
                height: 15,
              ),
              const textdecoration(
                text: 'Current Age',
              ),
              const SizedBox(
                height: 15,
              ),
              BlueTextField(
                controller: currentAge,
                initialValue: currentAge.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please enter your current age';
                },
                hintText: 'Enter current age',
              ),
              const SizedBox(
                height: 20,
              ),
              BlueButton(
                onPressed: () {
                  _calculatePension(
                    monthlyContribution.text,
                    annualReturn.text,
                    currentAge.text,
                  );
                },
               title: 'Calculate',
              ),
              const SizedBox(
                height: 20,
              ),
              if (_totalInvestment.isNotEmpty)
                Card(
                  color: Colors.blue[50],
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'Total Investment (₹)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _totalInvestment,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Interest Earned (₹)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _interestEarned,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Maturity Amount (₹)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _maturityAmount,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Minimum Annuity Investment (₹)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _minAnnuityInvestment,
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
