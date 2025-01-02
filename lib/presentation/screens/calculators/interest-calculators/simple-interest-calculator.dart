import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/main.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';
import 'package:itax/presentation/widgets/blue_button.dart';



class SimpleIntrest extends StatefulWidget {
  const SimpleIntrest({super.key});

  @override
  State<SimpleIntrest> createState() => _SimpleIntrestState();
}

class _SimpleIntrestState extends State<SimpleIntrest> {
  String _solution = '';

  TextEditingController principle1 = TextEditingController();
  TextEditingController rate1 = TextEditingController();
  TextEditingController year1 = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 5,
            ),
            Text('Principle', style: TextStyle(fontSize: 18.sp)),
            const SizedBox(
              height: 15,
            ),
            BlueTextField(
              controller: principle1,
              initialValue: principle1.text,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return 'Please enter the amount';
              },
              hintText: 'Enter Principle',
            ),
            const SizedBox(
              height: 15,
            ),
            
                        Text('Rate', style: TextStyle(fontSize: 18.sp)),

            const SizedBox(
              height: 15,
            ),
            BlueTextField(
              controller: rate1,
              initialValue: rate1.text,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return 'Please enter the rate';
              },
              hintText: 'Enter Rate',
            ),
            const SizedBox(
              height: 15,
            ),
                        Text('Year', style: TextStyle(fontSize: 18.sp)),

            const SizedBox(
              height: 15,
            ),
            BlueTextField(
              controller: year1,
              initialValue: year1.text,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return 'Please enter the year';
              },
              hintText: 'Enter Year',
            ),
            const SizedBox(
              height: 15,
            ),
            BlueButton(
              onPressed: () async {
                if (principle1.text.isEmpty ||
                    rate1.text.isEmpty ||
                    year1.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.yellow,
                      content: Text(
                        "Please fill in all fields",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                  return;
                }

                try {
                  double principle = double.parse(principle1.text);
                  double rate = double.parse(rate1.text);
                  double year = double.parse(year1.text);

                  double simpleInterest = (principle * rate * year) / 100;

                  setState(() {
                    _solution =
                        "Simple Interest: ₹${simpleInterest.toStringAsFixed(2)}";
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Please enter valid numbers",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
              },
              title: isLoading ? 'Calculating...' : 'Calculate',
            ),
            const SizedBox(
              height: 20,
            ),
            if (_solution.isNotEmpty)
              Text(
                _solution,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
