import 'dart:math';
import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/screens/calculators/widgets/text-decoration-widget.dart';
import 'package:itax/presentation/widgets/blue_button.dart';


class CagrCalulator extends StatefulWidget {
  const CagrCalulator({super.key});

  @override
  State<CagrCalulator> createState() => _CagrCalulatorState();
}

class _CagrCalulatorState extends State<CagrCalulator> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController totalInvestment = TextEditingController();
  TextEditingController matuarityValue = TextEditingController();
  TextEditingController years = TextEditingController();

  String _cagrResult = "";

  /// Function to calculate CAGR
  void _calculateCAGR() {
    if (_formKey.currentState!.validate()) {
      double principal = double.parse(totalInvestment.text);
      double maturity = double.parse(matuarityValue.text);
      double time = double.parse(years.text);

      // Calculate CAGR
      double cagr = pow((maturity / principal), (1 / time)) - 1;

      setState(() {
        _cagrResult = "${(cagr * 100).toStringAsFixed(2)}%";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAGR Calculator'),
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
                text: 'Total Investment',
              ),
              const SizedBox(
                height: 15,
              ),
              BlueTextField(
                controller: totalInvestment,
                initialValue: totalInvestment.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please Enter Total Investment';
                },
                hintText: 'Enter Total Investment',
              ),
              const SizedBox(
                height: 15,
              ),
              const textdecoration(
                text: 'Maturity Value',
              ),
              const SizedBox(height: 15),
              BlueTextField(
                controller: matuarityValue,
                initialValue: matuarityValue.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please Enter Maturity Value';
                },
                hintText: 'Enter Maturity Value',
              ),
              const SizedBox(
                height: 15,
              ),
              const textdecoration(
                text: 'Years',
              ),
              const SizedBox(height: 15),
              BlueTextField(
                controller: years,
                initialValue: years.text,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return 'Please Enter Years';
                },
                hintText: 'Enter Years',
              ),
              const SizedBox(
                height: 20,
              ),
              BlueButton(
                onPressed: _calculateCAGR,
                title: 'Calculate CAGR'
              ),
              const SizedBox(
                height: 20,
              ),
              if (_cagrResult.isNotEmpty)
                Card(
                  color: Colors.blue[50],
                  child: ListTile(
                    title: const Text(
                      'CAGR Result',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _cagrResult,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
