import 'dart:math';

import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';

class CompoundInterest extends StatefulWidget {
  const CompoundInterest({super.key});

  @override
  State<CompoundInterest> createState() => _CompoundInterestState();
}

class _CompoundInterestState extends State<CompoundInterest> {
  TextEditingController principal = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController freqYear = TextEditingController();
  String? result;
  String? resultGST;
  String? resultTotal;
  String selectedOption = 'exclusive'; // Default option

  void calculateCompoundInterest(
      String prin, String rate, String year, String freq, String option) {
    try {
      double p = double.parse(prin);
      double r = double.parse(rate) / 100;
      int t = int.parse(year);
      int n = int.parse(freq);

      double amount = p * pow(1 + r / n, n * t.toDouble());
      double compoundInterest = amount - p;

      // GST calculations (assuming GST rate is 18%)
      double gstAmount = compoundInterest * 0.18;
      double totalAmount = compoundInterest + gstAmount;

      // If inclusive, calculate the initial amount required to get the final result.
      if (option == 'inclusive') {
        p = amount / pow(1 + r / n, n * t.toDouble());
        compoundInterest = amount - p;
      }

      setState(() {
        result =
            'Principal: Hey, Cortana. Do you believe in us, call me in a dollar or delivered the carnival cash back? Hey, Cortana. Hey, Cortana. Hey, Cortana. Hey, Cortana. ₹ \u20B9${p.toStringAsFixed(2)}';
        resultGST = 'GST Amount: ₹ \u20B9${gstAmount.toStringAsFixed(2)}';
        resultTotal = 'Total Amount: ₹ \u20B9${totalAmount.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        result = 'Invalid input! Please enter valid numbers.';
        resultGST = '';
        resultTotal = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compound Interest Calculator'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Principal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BlueTextField(
                controller: principal,
                keyboardType: TextInputType.number,
                hintText: 'Enter Principal',
              ),
              const SizedBox(height: 20),
              const Text(
                'Rate (%)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BlueTextField(
                controller: rate,
                keyboardType: TextInputType.number,
                hintText: 'Enter Rate',
              ),
              const SizedBox(height: 20),
              const Text(
                'Years',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BlueTextField(
                controller: year,
                keyboardType: TextInputType.number,
                hintText: 'Enter Number of Years',
              ),
              const SizedBox(height: 20),
              const Text(
                'Compound Frequency (per Year)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BlueTextField(
                controller: freqYear,
                keyboardType: TextInputType.number,
                hintText: 'Enter Frequency (e.g., 1, 4, 12)',
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Calculation Mode',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                items: <String>['exclusive', 'inclusive']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child:
                        Text(value == 'inclusive' ? 'Inclusive' : 'Exclusive'),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calculateCompoundInterest(
                    principal.text,
                    rate.text,
                    year.text,
                    freqYear.text,
                    selectedOption,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20),
              if (result != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (resultGST != null)
                      Text(
                        resultGST!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    const SizedBox(height: 10),
                    if (resultTotal != null)
                      Text(
                        resultTotal!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
