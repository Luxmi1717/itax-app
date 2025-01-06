import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/calculators/widgets/blue-text-feild-widget.dart';

class GstCalcPage extends StatefulWidget {
  const GstCalcPage({super.key});

  @override
  State<GstCalcPage> createState() => _GstCalcPageState();
}

class _GstCalcPageState extends State<GstCalcPage> {
  TextEditingController principal = TextEditingController();
  TextEditingController rate = TextEditingController();

  String? result;
  String? resultGST;
  String? resultTotal;
  String selectedOption = 'exclusive'; // Default option

  void calculateCompoundInterest(String prin, String rate, String option) {
    try {
      double p = double.parse(prin);
      double r = double.parse(rate) / 100;

      double amount;
      double AfterGstAmount;
      double gstAmount;
      double totalAmount;

      if (option == 'inclusive') {
        // For inclusive, the given amount includes GST.
        double totalWithGST = p; // User-entered total amount.
        amount = totalWithGST / (1 + r);

        // Removing GST to find actual amount.
        gstAmount = totalWithGST - amount; // GST amount.
        p = p - gstAmount;
        totalAmount = totalWithGST; // The entered total.
      } else {
        // For exclusive, calculate GST and total separately.

        gstAmount = p * r; // GST based on principal.

        totalAmount = p + gstAmount; // Final total.
      }

      setState(() {
        result = '\u20B9${p.toString()}';
        resultGST = '\u20B9${gstAmount.toString()}';
        resultTotal = '\u20B9${totalAmount.toString()}';
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
        title: Text('GST Calculator', style:  TextStyle(fontSize: 16.sp, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Amount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BlueTextField(
                controller: principal,
                keyboardType: TextInputType.number,
                hintText: 'Enter Amount',
              ),
              const SizedBox(height: 20),
              const Text(
                'GST Rate (%)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              BlueTextField(
                controller: rate,
                keyboardType: TextInputType.number,
                hintText: 'Enter Rate',
              ),
              const SizedBox(height: 20),
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
                      principal.text, rate.text, selectedOption);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20),
              if (result != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(
                    //   result!,
                    //   style: const TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.green,
                    //   ),
                    // ),
                    Card(
                      color: Colors.blue[50],
                      child: ListTile(
                        title: const Text('Actual Amount: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle:
                            Text(result!, style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (resultGST != null)
                      Card(
                        color: Colors.blue[50],
                        child: ListTile(
                          title: const Text('Total GST: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(resultGST!,
                              style: const TextStyle(fontSize: 18)),
                        ),
                      ),
                    const SizedBox(height: 10),
                    if (resultTotal != null)
                      Card(
                        color: Colors.blue[50],
                        child: ListTile(
                          title: const Text('Total: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(resultTotal!,
                              style: const TextStyle(fontSize: 18)),
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
